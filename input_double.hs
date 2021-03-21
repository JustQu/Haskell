-- main :: IO()
-- main = do
--     x <- getLine >>= \x -> return (read x :: Double)
--     y <- getLine >>= \x -> return (read x :: Double)
--     print $ x + y

input_double :: String -> IO Double
input_double m = putStrLn m >> getLine >>= return . read

main :: IO()
main = do
    x <- input_double "Number X: "
    y <- input_double "Number Y: "
    putStr "Result: " >> print (x + y)
