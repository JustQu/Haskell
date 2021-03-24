-- Нахождение делителей числа, проверка на простое число и вывод определенного количества простых чисел

divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], mod n x == 0]

isPrime :: Int -> Bool
isPrime n | n <= 1 = False
isPrime n = divisors n == [1, n]

primeNumbers :: Int -> [Int]
primeNumbers n = 2 : take (n - 1) (filter isPrime [3, 5 ..])

main :: IO()
main = do
    print $ divisors 50
    print $ isPrime 23
    print $ primeNumbers 10
