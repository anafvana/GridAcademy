-- REVISION
-- Take
taker 1 (x:xs) = [x]
taker nr (x:xs) = x:taker (nr - 1) xs

-- Fibonacci
fibo 0 = 0
fibo 1 = 1
fibo n = fibo (n-1) + fibo(n-2)

-- Reduce right
redr :: (a -> a -> a) -> [a] -> a
redr fun [x] = x
redr fun (x:xs) = fun x (redr fun xs)


-- CORRECTION OF PAST MISTAKES
-- Reduce left
redl :: (a -> a -> a) -> [a] -> a
redl fun [x] = x
redl fun (x:(y:ys)) = redl fun ((fun x y):ys)

-- Although a version of reduce left like
-- redl fun [x] = x
-- redl fun (x:xs) = fun (redl fun xs) x
-- actually works for string concatenation, it does not work for operations such as minus
-- Ex: [1..5] would be ((((5 - 4) - 3) - 2) - 1) resulting in 3, rather than -13 (as we expect)

-- NEW STUFF
-- Map
mapper :: (a -> b) -> [a] -> [b]
mapper fun [x] = [fun x]
mapper fun (x:xs) = (fun x):(mapper fun xs)

-- Multiply values in list by two
-- mapper (\ x -> x * 2) [1..4]
-- [2,4,6,8]

-- Concatenate strings from a list to themselves
-- mapper (\ x -> x ++ x) ["waka", "taka", "kage"]
-- ["wakawaka","takataka","kagekage"]

-- Return list with length of each string from a list of strings
-- mapper (\ x -> length x) ["waka", "waka", "eh", "eh", "saminami"]
-- [4,4,2,2,8]


-- Implementing a function that maps list of strings to a list of their lengths (abstracting away mapper)
lengther :: [String] -> [Int]
lengther = mapper (\ x -> length x)
-- lengther ["waka", "waka", "eh", "eh", "saminami")
-- [4,4,2,2,8]


-- Filter
filt :: (a -> Bool) -> [a] -> [a]
filt fun [x] = if fun x then [x] else []
filt fun (x:xs) = (filt fun [x]) ++ (filt fun xs)

-- Filt, but not hacky
filt2 fun [x] = if fun x then [x] else []
filt2 fun (x:xs) = if fun x then x:(filt fun xs) else (filt fun xs)

-- Filter, but with guards
filtr :: (a -> Bool) -> [a] -> [a]
filtr fun [x]
   | fun x = [x]
   | otherwise = []
filtr fun (x:xs)
   | fun x = x:(filtr fun xs)
   | otherwise = (filtr fun xs)


-- Higher-kinded types
-- An introduction to this concept so that it sits on my brain and gets processed when the time comes
-- List :: Type -> Type -- List of Type is a higher type than, for example, List of Int. That is because you need to feed it a type so it returns another concrete type. Feed List with "Int" and it returns "List of Int"
-- Int :: Type
-- [Int] :: Type
-- (Int -> Int) :: Type
-- These other types are what they are. You don't feed them a type, they're as concrete as they come
