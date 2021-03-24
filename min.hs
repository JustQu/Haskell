-- min' = min
min' :: Ord a => a-> a -> a
min' x y | x < y = x | otherwise = y
