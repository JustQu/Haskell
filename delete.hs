-- delete' = delete

delete' :: Eq a => a -> [a] -> [a]
delete' _ [] = []
delete y (x:xs)
    | y /= x = x : delete' y xs
    | otherwise = xs
