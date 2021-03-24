-- foldr1' = foldr1
foldr1' :: (a -> a -> a) -> [a] -> a
foldr1' _ [] = undefined
foldr1' _ [x] = x
foldr1' f (x:xs) = f x (foldr1' f xs)
