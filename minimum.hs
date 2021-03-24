-- minimum' = minimum
minimum' :: Ord a => [a] -> a
minimum' [] = undefined
minimum' [x] = x
minimum' (x:xs) = min x $ minimum' xs
