-- foldl1' = foldl1
foldl1' :: (a -> a -> a) -> [a] -> a
foldl1' _ [] = undefined
foldl1' _ [x] = x
foldl1' f (x:y:ys) = foldl1' f (f x y : ys)
