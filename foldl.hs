--foldl' = foldl

foldl' :: (a -> b -> a) -> a -> [b] -> a
foldl' _ y [] = y
foldl' f y (x:xs) = foldl' f (f y x) xs
