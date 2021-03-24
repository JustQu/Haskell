-- scanl' = scanl
scanl' :: (a -> b -> a) -> a -> [b] -> [a]
scanl' _ n [] = [n]
scanl' f n (x:xs) = n : scanl' f (f n x) xs
