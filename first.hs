func :: [Int] -> [Int]
func [] = []
func (x:xs) = xs ++ [x]

last1 :: [Int] -> [Int]
last1 [x] = [x]
last1 (x:xs) = last1 xs

dellast :: [Int] -> [Int]
dellast [] = []
dellast [x] = []
dellast (x:xs) = [x] ++ dellast xs

listlast1 :: [Int] -> [Int]
listlast1 [] = []
listlast1 (x:xs) = dellast (last1 xs ++ [x] ++ xs)

getfirst :: [Int] -> Int
getfirst [] = 0
getfirst (x:xs) = x

getlast :: [Int] -> Int
getlast [x] = x
getlast (x:xs) = getlast xs

listgetsecond :: [Int] -> Int
listgetsecond [] = 0
listgetsecond (x:xs) = getfirst(xs)

getpreprev :: [Int] -> Int
getpreprev [] = 0
getpreprev x = getlast (dellast x)

getpreprev1 :: [Int] -> [Int]
getpreprev1 [] = []
getpreprev1 (x:xs)
    | xs == [] = []
    | getpreprev1 xs == [] = [x]
    | otherwise = getpreprev1 xs
