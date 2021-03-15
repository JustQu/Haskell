factorial' :: Integer -> Integer
factorial' x | x < 2 = 1
factorial' x = (*) x $ factorial' $ x - 1

main :: IO()
main = print $ factorial' 6
