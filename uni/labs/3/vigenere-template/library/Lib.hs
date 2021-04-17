module Lib where

import Data.Char (chr, ord)

import Data.List

vigenere :: [Char] -> [Int] -> String -> String
vigenere alphabet key message =
    zipWith f (cycle (map (\x -> if x < 0 then length alphabet + x else x) key)) message
    where
        getValue :: Maybe Int -> Int
        getValue (Just x) = x
        getValue Nothing = -1
        f k c = let index = getValue $ elemIndex c alphabet
            in if index /= -1
                then (cycle alphabet) !! (index + k)
                else c


unvigenere :: [Char] -> [Int] -> String -> String
unvigenere alphabet key = vigenere alphabet (map negate key)

-- main :: IO()
-- main = do
--     print $ map (\x -> if x < 0 then 6 - x else x) [3, -2, 4, 5]
--     print $ vigenere "helowr" [3, -2, 4, 5] "hello, world"
