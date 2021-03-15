fibonacci :: Integer -> Integer
fibonacci x | x < 3 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)

main :: IO()
main = print $ fibonacci 6
