--(...) = (.)

(...) :: (b -> c) -> (a -> b) -> (a -> c)
(...) g f = \x -> g $ f x
