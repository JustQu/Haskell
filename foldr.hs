--foldr' = foldr
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' _ y [] = y
foldr' f y (x:xs) = f x $ foldr' f y xs
