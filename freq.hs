-- Нахождение количества символов с частотой встречаемости
import Data.List (group, sort)

quantity :: Ord a => [a] -> [(Int, a)]
quantity = map (\xs -> (length xs, head xs)) . group . sort

frequency :: Int -> [(Int, a)] -> [(Int, a, Float)]
frequency n = map (\(a, b) -> (a, b, fromIntegral a / fromIntegral n * 100))

main :: IO()
main = print $ frequency (length list) (quantity list)
    where list = "AABCACBCBAACBBAACCABC"
