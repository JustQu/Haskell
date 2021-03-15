--dropWhile' = dropWhile

dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' _ [] = []
dropWhile' f (x : xs)
    | f x = dropWhile' f xs
    | otherwise = x : xs

dropWhile'' :: (a -> Bool) -> [a] -> [a]
dropWhile'' _ [] = []
dropWhile'' f qq@(x : xs)
    | f x = dropWhile'' f xs
    | otherwise = qq

main :: IO()
main = print $ dropWhile'' (< 4) [1..10]
