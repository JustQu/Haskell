-- deleteBy' = deleteBy
deleteBy' :: (a -> a -> Bool) -> a -> [a] -> [a]
deleteBy' _ _ [] = []
deleteBy' f n (x:xs)
    | f n x = xs
    | otherwise = x : deleteBy' f n xs
