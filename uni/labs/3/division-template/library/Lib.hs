module Lib where

-- 0 17 / 5
-- 1 12 5
-- 2 7 5
-- 3 2 5

-- 0 -17 / 5
--

-- 0 17 / -5
-- -3 2

-- 0 -23 -6
-- 4 1

-- не совпадает с quotRem из-за другого остатка

myDiv :: Integer -> Integer -> (Integer, Integer)
myDiv dividend divisor
    | (dividend < 0) && (divisor < 0) = ((fst x + 1), (negate divisor) - (snd x))
        where x = myDiv (negate dividend) (negate divisor)
myDiv dividend divisor
    | (dividend < 0) = ((negate $ fst x + 1), divisor - (snd x))
        where x = myDiv (negate dividend) divisor
myDiv dividend divisor
    | (divisor < 0) = myDiv (negate dividend) (negate divisor)
    | dividend < divisor = (0, dividend)
    | otherwise = ((fst x + 1), snd x)
        where x = myDiv (dividend-divisor) divisor

-- main :: IO()
-- main = do
--     print $ myDiv 78 33
--     print $ myDiv (negate 78) 33
--     print $ myDiv 78 (negate 33)
--     print $ myDiv (negate 9) (negate 13)
--     print $ myDiv (9) (90)
--     print $ myDiv (78) (26)
