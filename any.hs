-- any' = any

any' :: (a -> Bool) -> [a] -> Bool
any' _ [] = False
any' f (x:xs)
    | not $ f x = any' f xs
    | otherwise = True
