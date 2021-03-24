-- scanr' = scanr
scanr' :: (a -> b -> b) -> b -> [a] -> [b]
scanr' f n [] = [n]
scanr' f n (x:xs) = f x (head $ scanr' f n xs) : scanr' f n xs
