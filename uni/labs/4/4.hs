import Data.Maybe

data MayHaveValue a = NoValue | HasValue a deriving (Show)

data ToBeOrNot a = NotToBe | ToBe a deriving (Show)

data HasSomething a = HasNothing | HasSomething a deriving (Show)

class Maybish a where
    fromMaybe :: Maybe b -> a b
    toMaybe :: a b -> Maybe b

instance Maybish MayHaveValue where
    fromMaybe (Just a) = HasValue a
    fromMaybe Nothing = NoValue

    toMaybe (HasValue a) = Just a
    toMaybe NoValue = Nothing

instance Maybish ToBeOrNot where
    fromMaybe (Just a) = ToBe a
    fromMaybe Nothing = NotToBe

    toMaybe (ToBe a) = Just a
    toMaybe NotToBe = Nothing

instance Maybish HasSomething where
    fromMaybe (Just a) = HasSomething a
    fromMaybe Nothing = HasNothing

    toMaybe (HasSomething a) = Just a
    toMaybe HasNothing = Nothing

instance Maybish Maybe where
    fromMaybe a = a
    toMaybe a = a
