-- all' = all
all' :: (a -> Bool) -> [a] -> Bool
all' _ [] = True
all' f (x:xs)
    |f x = all' f xs
    | otherwise = False
