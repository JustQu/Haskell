-- product' = product
product' :: Num a => [a] -> a
product' = foldl1 (*)
