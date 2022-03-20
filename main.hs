--stack --resolver lts script

-- Basic functions
f x = x + 5
f 2
-- 7


g x = x + 2
g 2
-- 4

h x = (g . f) x
h = g . f
h 2
-- g (f(2)) = g(7) = 9


-- Currying a function
f = take 5
f [1..10]
-- [1,2,3,4,5]

g = head . tail
g [1..10]
-- 2


-- Destructuring a list
x:xs = [1,2,3,4,5]
-- x = 1; xs = [2,3,4,5]


-- Head & Tail
header (x:xs) = x
header [1..5]
-- 1

tailer (x:xs) = xs
tailer [1..5]
-- [2,3,4,5]


-- Take

take 5 [1..10]
-- [1,2,3,4,5]

--take :: Int -> [a] -> [a]
--take :: Int -> ([a] -> [a])
--take :: (Int, [a]) -> [a]
--take = --definition

taker :: Int -> [a] -> [a]
taker nr (x:xs)
    | nr == 1 = [x]
    | otherwise = x:(taker (nr - 1) xs)

taker 5 [1..10]
-- [1,2,3,4,5]

-- In JavaScript:
--const taker = (nr, list) =>
--	nr == 1 ?
--		head(list) :
--		cons( head(list), taker( (nr - 1), tail(list) )


main = do {
    print $ taker 5 [1..10]
}
