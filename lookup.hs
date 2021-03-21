--lookup' = lookup

lookup' :: Eq a => a -> [(a, b)] -> Maybe b
lookup' _ [] = Nothing
lookup' x ((a, b):xs)
    | x == a = Just b
    | otherwise = lookup' x xs
