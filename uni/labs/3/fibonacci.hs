fibN :: Integer -> Integer
fibN x | x < 3 = 1
fibN x = fibN (x - 1) + fibN (x - 2)

-- 1 2 3 4 5 6 7
-- 1 1 2 3 5 8 13

fibNTailRecursive :: Integer -> Integer
fibNTailRecursive x = f 1 1 x
    where
        f :: Integer -> Integer -> Integer -> Integer
        f first second iter
            | iter < 1 = first
            | iter == 2 = second
            | iter == 3 = first + second
            | otherwise = f second (first + second) (iter - 1)


fibNaive :: [Integer]
fibNaive = map fibNTailRecursive [1 ..]

fib :: [Integer]
fib = 1 : 1 : zipWith (+) fib (tail fib)

main :: IO()
main = do
    print $ fibN 10
    print $ fibNTailRecursive 10
    print $ fibNaive !! 10
