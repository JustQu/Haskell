-- drop' = drop

drop' :: Int -> [a] -> [a]
drop' _ [] = []
drop' n qq@(_:xs)
    | n /= 0 = drop' (n - 1) xs
    | otherwise = qq
