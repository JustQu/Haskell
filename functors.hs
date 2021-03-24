import Control.Applicative
-- Типы данных, которые относятся к классу Functor представляют собой функторы
-- Класс Functor достаточно легкий и в нем содержится всего одна функция (метод)
-- class Functor f where
    -- fmap :: (a -> b) -> f a -> f b
-- Фактически, любая монада, является автоматически функтором.
-- main :: IO()
-- main = fmap reverse getLine >>= print

data Action a = With a | None deriving Show

instance Functor Action where
    fmap f (With x) = With (f x)
    fmap f None = None

-- main :: IO()
-- main = print $ fmap f (With 5)
--     where f = (^ 2)

-- fmap == <$>
-- main = print $ (^2) <$> (Just 5)

-- Существуют еще помимо обычных функторов - Аппликативные функторы. Данные функторы являются типами данныхЮ которые относятся к классу Applicative
-- class Functor f => Applicative f where
    -- pure :: a -> f a
    -- (<*>) :: f (a -> b) -> f a -> f b

    -- (*>) :: f a -> f b -> f b
    -- (*>) u v = pure (const id) <*> u <*> v

    -- (<*) :: f a -> f b -> f a
    -- (<*) u v = pure const <*> u <*> v

-- main :: IO()
-- main = print $ Just (+3) <*> Just 2

main :: IO()
main = print $ [(*2), (+3)] <*> [1, 2, 3]
