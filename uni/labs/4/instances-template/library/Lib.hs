module Lib where

import Control.Applicative

data Singleton a = Singleton a deriving (Eq, Show)
data Productish a b = Productish a b deriving (Eq, Show)
data Summish a b = First a | Second b deriving (Eq, Show)
data Optional a = NoValue | HasValue a deriving (Eq, Show)
data NotQuiteList a = Value a | Layer (NotQuiteList a) deriving (Eq, Show)
data NotEmpty a = LastValue a | MidValue a (NotEmpty a) deriving (Eq, Show)

-- Singleton
instance Functor Singleton where
  fmap f (Singleton x) = Singleton (f x)

instance Applicative Singleton  where
  pure x = Singleton x
  (<*>) (Singleton f) (Singleton x) = Singleton (f x)

instance Monad Singleton where
  (>>=) (Singleton x) f = f x

instance Foldable Singleton where
    foldMap f (Singleton a) = f a

instance Traversable Singleton where
  traverse f (Singleton x) = fmap Singleton (f x)

-- Productish
instance Functor (Productish x) where
  fmap f (Productish a b) = Productish a (f b)

instance (Monoid a) => Applicative (Productish a) where
  pure a = Productish mempty a
  (<*>) (Productish f1 f2) (Productish a b) = Productish (f1 <> a) (f2 b)

instance (Monoid a) => Monad (Productish a) where
  (>>=) q@(Productish a b) f = g a (f b)
      where
          g a (Productish t v) = Productish (a <> t) v

instance Foldable (Productish a) where
    foldMap f (Productish a b) = f b

instance Traversable (Productish a) where
  sequenceA (Productish a b) = fmap (Productish a) b

-- Summish
instance Functor (Summish a) where
  fmap f (First a) = First a
  fmap f (Second b) = Second (f b)

instance Applicative (Summish a) where
  pure x = Second x
  liftA2 f as bs = do
      a <- as
      b <- bs
      pure (f a b)

instance Monad (Summish a) where
  (>>=) (First a) f = First a
  (>>=) (Second b) f = (f b)

instance Foldable (Summish a) where
    foldr _ z (First _) = z
    foldr f z (Second b) = f b z

instance Traversable (Summish a) where
  traverse f (Second b) = fmap Second (f b)
  traverse f (First a) = pure (First a)


-- Optional
instance Functor Optional where
  fmap f NoValue = NoValue
  fmap f (HasValue a) = HasValue (f a)

instance Applicative Optional where
  pure = HasValue
  (<*>) (NoValue) _ = NoValue
  (<*>) _ (NoValue) = NoValue
  (<*>) (HasValue f)  (HasValue a) = HasValue (f a)


instance Monad Optional where
  (>>=) NoValue f = NoValue
  (>>=) (HasValue a) f = f a


instance Foldable Optional where
    foldr f b NoValue = b
    foldr f z (HasValue a) = f a z

instance Traversable Optional where
  traverse _ NoValue = pure NoValue
  traverse f (HasValue a) = fmap HasValue (f a)


-- NotQuiteList
instance Functor NotQuiteList where
  fmap f (Value a) = Value (f a)
  fmap f (Layer a) = Layer (fmap f a)

instance Applicative NotQuiteList where
  pure = Value
  (<*>) (Value f) (Value a) = Value (f a)
  (<*>) (Layer f) a= Layer (f <*> a)
  (<*>) f (Layer a) = Layer (f <*> a)

instance Monad NotQuiteList where
  (>>=) (Value a) f = f a
  (>>=) (Layer a) f = Layer (a >>= f)

instance Foldable NotQuiteList where
    foldr f b (Value a) = f a b
    foldr f b (Layer a) =  foldr f b a

instance Traversable NotQuiteList where
  traverse f (Value a) = fmap Value (f a)
  traverse f (Layer a) = fmap Layer (traverse f a)

-- NotEmpty
instance Functor NotEmpty where
  fmap f (LastValue a) = LastValue (f a)
  fmap f (MidValue a b) = MidValue (f a) (fmap f b)

instance Applicative NotEmpty where
  pure a = LastValue a
  (<*>) (LastValue f) (LastValue a) = LastValue (f a)
  (<*>) ff@(LastValue f) (MidValue a b) = MidValue (f a) (ff <*> b)
  (<*>) ff@(MidValue f f1) (MidValue a b) = MidValue (f a) (f1 <*> b)
  (<*>) ff@(MidValue f f1) q@(LastValue a) = MidValue (f a) (f1 <*> q)

instance Monad NotEmpty where
  -- ???????????????????????
  (>>=) (LastValue a) f = f a
--   (>>=) (MidValue a b) f = b >>= f
  (>>=) (MidValue a b) f = MidValue (g (f a)) (b >>= f)
    where
        g (LastValue a) = a
        g (MidValue a b) = a

instance Foldable NotEmpty where

    foldr f z (LastValue a) = f a z
    foldr f z (MidValue a b) = f a (foldr f z b)

instance Traversable NotEmpty where
  traverse f (LastValue a) = fmap LastValue (f a)
  traverse f (MidValue a b) = liftA2 MidValue (f a) (traverse f b)
