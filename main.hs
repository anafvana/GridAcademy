--stack --resolver lts script


-- BASIC FUNCTIONS

basicF x = x + 5
-- basicF 2
-- 7


basicG x = x + 2
-- basicG 2
-- 4

basicH x = (basicG . basicF) x
basicHCurried = basicG . basicF
-- basicH 2
-- basicG (basicF(2)) = basicG(7) = 9



-- CURRYING A FUNCTION

curryF = take 5
-- curryF [1..10]
-- [1,2,3,4,5]

curryG = head . tail
-- curryG [1..10]
-- 2



-- DESTRUCTURING A LIST

x:xs = [1,2,3,4,5]
-- x = 1; xs = [2,3,4,5]



-- HEAD & TAIL

header (x:xs) = x
-- header [1..5]
-- 1

tailer (x:xs) = xs
-- tailer [1..5]
-- [2,3,4,5]



-- TAKE

-- take 5 [1..10]
-- [1,2,3,4,5]

--take :: Int -> [a] -> [a]
--take :: Int -> ([a] -> [a])
--take :: (Int, [a]) -> [a]
--take = --definition

taker :: Int -> [a] -> [a]
taker nr (x:xs)
    | nr == 1 = [x]
    | otherwise = x:(taker (nr - 1) xs)

-- taker 5 [1..10]
-- [1,2,3,4,5]

-- In JavaScript:
--const taker = (nr, list) =>
--	nr == 1 ?
--		head(list) :
--		cons( head(list), taker( (nr - 1), tail(list) )



-- MAIN (EXAMPLE)

-- main = do {
--    print $ taker 5 [1..10]
--}



