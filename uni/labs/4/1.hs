import Data.Function (on)
import Control.Applicative

data PersonWithAgeAndAddress = PersonWithAgeAndAddress
  { pwaName :: String,
    pwaAge :: Word,
    pwaAddress :: String
  }
  deriving (Eq)

instance Ord PersonWithAgeAndAddress where
  compare =
    (compare `on` pwaName)
      ? (compare `on` pwaAge)
      ? (compare `on` pwaAddress)
    where
      infixr 6 ? -- так же, как и у <>
      (f1 ? f2) x y = f1 x y <> f2 x y

-- здесь примерно эквивалентно
-- (?) = (liftA2 . liftA2) (<>)

data PersonWithAge = PersonWithAge {
    personName :: String,
    personAge :: Int
} deriving (Show)


instance Eq PersonWithAge where
    -- x == y = ((==) `on` personName) x y
        -- && ((==) `on` personAge) x y
    (==) = (liftA2 . liftA2) (&&)
        ((==) `on`personName)
        ((==) `on` personAge)

data Tree a = Leaf a | Branch (Tree a) (Tree a) deriving (Show)

instance Functor Tree where
  fmap f (Leaf x) = Leaf (f x)
  fmap f (Branch a b) = Branch (fmap f a) (fmap f b)

instance Applicative Tree where
  pure x = Leaf x
  (Branch f1 f2) <*> (Branch x y) = Branch (f1 <*> x) (f2 <*> y)
  -- остальное так же
  (Branch f1 f2) <*> (Leaf x) = Branch (f1 <*> Leaf x) (f2 <*> Leaf x)
  (Leaf f) <*> (Branch x y) = Branch (f <$> x) (f <$> y)
  (Leaf f) <*> (Leaf x) = Leaf (f x)


