elemIndex' :: Eq a => a -> [a] -> Maybe Int
elemIndex' _ [] = Nothing
elemIndex' y (x:xs)
    | y == x = Just 0
    | otherwise = 1 + elemIndex' y xs

-- toUpper' = toUpper

toUpper' :: Char -> Char
toUpper' c =
    let index = getValue $ elemIndex' c ['a'..'z']
    in if index /= -1 then ['A'..'Z'] !! index else c
    where
        getValue :: Maybe Int -> Int
        getValue (Just x) = x
        getValue Nothing = -1
