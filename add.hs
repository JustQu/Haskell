add :: Num a => a -> a -> a
add x y = x + y

main :: IO()
main = print $ add 5 6
