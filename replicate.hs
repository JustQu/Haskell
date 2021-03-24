-- replicate' = replicate
replicate' :: Int -> a -> [a]
replicate' x _ | x <= 0 = []
replicate' x y = y : replicate' (x - 1) y
