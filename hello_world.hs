{-# LANGUAGE MultiWayIf #-}
--1. if then else
func x = if x == 1
    then "hello"
    else if x == 2
        then "world"
        else "undefined"

--2. case of
func2 x = case x of
    1 -> "hello"
    2 -> "world"
    otherwise -> "undefined"

--3. function argument. Сопоставление с образцом
func3 1 = "hello"
func3 2 = "world"
func3 _ = "undefined"

--4. function argument and condition
func4 x | x == 1 = "hello"
func4 x | x == 2 = "world"
func4 _ = undefined

--5. guard
func5 x
    | x == 1 = "hello"
    | x == 2 = "world"
    | otherwise = "undefined"

--6. guard if Чтобы использовать эту конструкцию ветвления, надо подключить расширение MultiWayIf
{-
Многострочный комментарий
-}

func6 x = if
    | x == 1 -> "hello"
    | x == 2 -> "world"
    | otherwise -> undefined

main::IO()
main = putStrLn "hello, world"
