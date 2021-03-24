calculate :: String -> Double
calculate = head . foldl func [] . words
    where
        func :: [Double] -> String -> [Double]
        func (x:y:zs) "+" = (y + x):zs
        func (x:y:zs) "-" = (y - x):zs
        func (x:y:zs) "*" = (y * x):zs
        func (x:y:zs) "/" = (y / x):zs
        func (x:y:zs) "^" = (y ** x):zs
        func xs y = read y:xs

main :: IO()
main = print $ calculate "1 2 - 4 5 + *"
