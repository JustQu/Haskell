-- cycle' = cycle

cycle' :: [a] -> [a]
cycle' x = x ++ cycle' x
