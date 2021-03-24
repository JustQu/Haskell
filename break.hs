-- break' = break

break' :: (a -> Bool) -> [a] -> ([a], [a])
break' f xs = (takeWhile (not . f) xs, dropWhile (not . f) xs)
