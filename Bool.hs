import Prelude (IO(), print, Show)
data Bool = False | True deriving (Show)

($) :: (a -> b) -> a -> b
($) f x = f x

(==) :: Bool -> Bool -> Bool
(==) True True = True
(==) False False = True
(==) _ _ = False

--main::IO() -- проверка работоспособности функции (==)
--main = print $ (==) True False

(/=) :: Bool -> Bool -> Bool
(/=) True False = True
(/=) False True = True
(/=) _ _ = False

-- main :: IO() -- проверка работоспособности функции (/=)
-- main = print $ (/=) True False

-- Воссоздадим функции && (AND) и || (OR), а также NOT:
(&&) :: Bool -> Bool -> Bool
(&&) True x = x
(&&) False _ = False

(||) :: Bool -> Bool -> Bool
(||) False x = x
(||) True _ = True

not :: Bool -> Bool
not True = False
not False = True

xor :: Bool -> Bool -> Bool
xor x y = (not x && y) || (x && not y)

--ветвление if then else
if_then_else :: Bool -> a -> a -> a
if_then_else True f _ = f
if_then_else False _ s = s

--рекурсивные функции and и or, которые содержат список типов Bool
and :: [Bool] -> Bool
and [] = True
and [x] = x
and (x:y:xs) = if_then_else (not x && y) (False) $ and (y:xs)

-- main :: IO() -- проверка работоспособности функции and
-- main = print $ and [True, True, False, True]

or :: [Bool] -> Bool
or [] = False
or [x] = x
or (x:y:xs) = if_then_else (x || y) (True) $ or (y:xs)

-- main :: IO() -- проверка работоспособности функции or
-- main = print $ or [True, True, False, True]
