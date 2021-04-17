module Lib where

-- "Наивный" рекурсивный вариант
fibN :: Integer -> Integer
fibN x | x < 3 = 1
fibN x = fibN (x - 1) + fibN (x - 2)

-- Вариант, использующий хвостовую рекурсию
fibNTailRecursive :: Integer -> Integer
fibNTailRecursive x = f 1 1 x
    where
        f :: Integer -> Integer -> Integer -> Integer
        f first second iter
            | iter < 1 = first
            | iter == 2 = second
            | iter == 3 = first + second
            | otherwise = f second (first + second) (iter - 1)

-- "Наивная" реализация на основе fibNTailRecursive и map
fibNaive :: [Integer]
fibNaive = map fibNTailRecursive [1 ..]

-- -- Рекурсивное определение с использованием zipWith
fib :: [Integer]
fib = 1 : 1 : zipWith (+) fib (tail fib)

-- Рекурсивное определение с использованием zipWith
-- fib :: [Integer]
-- fib =  undefined
