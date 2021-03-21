notEndOfString :: Char -> Bool
notEndOfString x = if x /= '\n' then True else False

getLine' :: IO String
getLine' = getContents >>= return . takeWhile notEndOfString

reverseLine :: String -> String
reverseLine = reverse . takeWhile notEndOfString

-- readIO - это просто смесь двух функция: read и return
-- input_double :: String -> IO Double
-- input_double m = putStr m >> getLine >>= readIO

-- readLn - смесь readIO и getLine
input_double :: String -> IO Double
input_double m = putStr m >> readLn

main :: IO()
main = input_double "1st: " >>= print
