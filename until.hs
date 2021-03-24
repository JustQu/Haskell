-- until' = until
until' :: (a -> Bool) -> (a -> a) -> a -> a
until' f g x
    | f (g x) = x
    | otherwise = until' f g $ g x
