import Data.Char (chr, ord, toUpper)

encrypt :: (Int -> Int -> Int) -> Int -> Char -> Char
encrypt f k c
    | elem c ['A'..'Z'] = chr $ (f (ord c) k - 65) `mod` 26 + 65

caesar :: Char -> Int -> String -> String
caesar c k xs = case toUpper c of
    'E' -> [encrypt (+) k (toUpper x) | x <- xs]
    'D' -> [encrypt (-) k (toUpper x) | x <- xs]

main :: IO()
main = print $ caesar 'e' 3 "Hello world"
