--(!!!) = (!!)
(!!!) :: [a] -> Int -> a
(!!!) _ n | n < 0 = error "index < 0"
(!!!) [] _ = error "index too large"
(!!!) (x:_) 0 = x
(!!!) (_:xs) n = xs !!! (n - 1)