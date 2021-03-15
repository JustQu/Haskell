--fst' = fst

fst' :: (a, b) -> a
fst' (x, _) = x

main :: IO()
main = print $ fst ("hello", 571)
