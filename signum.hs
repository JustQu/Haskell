-- signum' = signum
signum' :: (Ord a, Num a) => a -> Int
signum' x | x > 0 = 1
signum' x | x < 0 = -1
signum' _ = 0
