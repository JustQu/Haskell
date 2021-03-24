-- scanr1' = scanr1
scanr1' :: (a -> a -> a) -> [a] -> [a]
scanr1' f [] = []
scanr1' f [x] = [x]
scanr1 f (x:xs) = f x (head $ scanr1' f xs) : scanr1' f xs
