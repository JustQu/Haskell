--swap first and second elements of the list
swap :: [Int] -> [Int]
swap [] = []
swap [x] = [x]
swap (x : y : xs) = y:x:xs

--move last element to the start
lastToFirst :: [Int] -> [Int]
lastToFirst [] = []
lastToFirst [x] = [x]
lastToFirst (x:xs)
	| xs == [] = [x]
	| otherwise = swap [x] ++ (lastToFirst xs)

--move first element to the end
func :: [Int] -> [Int]
func [] = []
func (x:xs) = xs ++ [x]

--get last element of the list
last' :: [Int] -> [Int]
last' [] = undefined
last' [x] = [x]
last' (_:xs) = last' xs

--remove last element of the list
delLast :: [Int] -> [Int]
delLast [] = []
delLast [_] = []
delLast (x:xs) = [x] ++ delLast xs

--get first element of the list
head' :: [Int] -> Int
head' [] = 0
head' (x:_) = x

--get second element of the list
listgetsecond :: [Int] -> Int
listgetsecond [] = 0
listgetsecond (_:xs) = head'(xs)

--get penultimate element of the list
penultimate :: [Int] -> [Int]
penultimate [] = []
penultimate (x:xs)
	| xs == [] = []
	| penultimate xs == [] = [x]
	| otherwise = penultimate xs