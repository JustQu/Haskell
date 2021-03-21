import Control.Monad.Except
import Control.Monad.Writer
import Control.Monad.Reader
import Control.Monad.State

-- Монады это типы данных, которые относятся к классу Monad. В этом классе находятся свои конкретные функции (методы).
-- Монады, которые относятся к этому классу, являются некоторой оберткой для других типов данных

-- для наглядности можно подставить IO вместо m
-- class Monad m where
--     (>>=)   :: m a -> (a -> m b) -> m b
--     (>>)    :: m a -> m b -> m b
--     return  :: a -> m a
--     fail    :: String -> m a
--

import qualified Data.Char as D (toLower)

-- main :: IO()
-- main = print $ "HELLO, WORLD" >>= func
    -- where func = \c -> return $ D.toLower c
-- main = print [D.toLower x | x <- "HELLO, WORLD"]

func :: [Int] -> [Int]
func xs = do
    x <- xs
    return $ x ^ 2
-- main :: IO()
-- main = print $ func [1..10]

-- data Maybe a = Just a | Nothing
-- main :: IO ()
-- main = print $ lookup 'c' [('a', '1'), ('b', '2'), ('c', '3'), ('d', '4')]

f :: Int -> Maybe Int
f 0 = Nothing
f x = Just x

g :: Int -> Maybe Int
g 100 = Nothing
g x = Just x

-- Задача: пропустить наше число последовательно через функции f и g
h :: Int -> Maybe Int
h x = case f x of
    Just n -> g n
    Nothing -> Nothing

--Если воспользуемся функцией класса Monad, тогда станет меньше:
h' :: Int -> Maybe Int
h' x = f x >>= g

-- main :: IO()
-- main = (print $ h 1) >> (print $ h' 1)

-- increment :: Int -> Maybe Int
-- increment 0 = Nothing
-- increment x = Just $ x + 1

-- Функцию increment можно было расписать немного иначе
increment :: Int -> Maybe Int
increment 0 = fail ""
increment x = return $ x + 1

-- main :: IO ()
-- main = do
--     print $ Just 5 >>= increment
--     print $ Just 0 >>= increment
--     print $ Nothing >>= increment

-- Монада Either


lookup' :: Eq a => a -> [(a, b)] -> Either String b
lookup' _ [] = Left "Error"
lookup' x ((a, b):xs)
    | x == a = Right b
    | otherwise = lookup' x xs

-- main :: IO()
-- main = print $ lookup' 'c' [('a', '1'), ('b', '2'), ('c', '3'), ('d', '4')]

-- Монада Writer полезна для записи логов
-- функция tell способна запаковывать наши данные в возвращаемое значение.
square :: Int -> Writer String Int
square x = tell (" Before:" ++ show x) >> (return $ x ^ 2)

-- функция runWriter помогает нам вывести итоговый кортеж
-- Сам тип Writer выглядит следующим образом:
-- data Writer w a = Writer { runWriter :: (a, w) }

-- main :: IO()
-- main = print $ runWriter $ square 2 >>= square >>= square

-- Монада Reader позволяет нам легко взаимодействовать с несколькими функциями.
-- ask = Reader $ \x -> x
square1 :: Reader Int Int
square1 = ask >>= return . (^ 2)

-- data Reader r a = Reader { runReader :: r -> a }
-- main :: IO()
-- main = print $ runReader square1 5

plusFive :: Reader Int Int
plusFive = ask >>= return . (+5)

square_and_plusFive :: Reader Int [Int]
square_and_plusFive = do
    one <- square1
    two <- plusFive
    return [one, two]

-- main :: IO()
-- main = print $ runReader square_and_plusFive 5

-- State схожа с монадой Reader, но помимо чтения, она также может записывать
-- функция get исполняет роль функции ask в монаде Reader, а функция put схожа с функцией tell в монаде Writer
square2 :: State Int [Char]
square2 = get >>= (\x -> (put $ x ^ 2) >> (return $ show x))

-- Определение тип State:
-- data State s a = State { runState :: s -> (a, s) }

main :: IO()
main = print $ runState square2 5
