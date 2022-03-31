-- REVISION
-- Take
taker :: Int -> [Int] -> [Int]
taker n (x:xs) =
   if n == 1
      then [x] -- Triggers (x, nil) so that we get the cons list
   else x:(taker (n-1) xs)

-- You can give competing definitions as long as they have decreasing specificity
takegrid 1 (x:xs) = [x] -- More specific
takegrid n (x:xs) = x : (takegrid (n-1) xs) -- Less specific
-- And thus you avoid if/else, because the n = 1 case is covered by the more specific definition

-- Factorials
factorialise 1 = 1
factorialise n = n * factorialise(n-1)

-- Fibonacci
fibonise 0 = 0
fibonise 1 = 1
fibonise n = fibonise (n-1) + fibonise (n-2)

-- BACK ON TRACK
-- Sum of ints
summation :: [Int] -> Int
summation [i] = i
summation (x:xs) = x + summation xs

-- Product of ints
production :: [Int] -> Int
production [i] = i
production (x:xs) = x * production xs

-- Concatenation
concatenation :: [String] -> String -- Strings are actually just [Char]
concatenation [word] = word
concatenation (x:xs) = x ++ concatenation(xs) -- ++ for any list concatenation


-- INTERLUDE: PREFIX & INFIX NOTATION
-- Haskell allows for both prefix and infix notation
-- Want a function as prefix, when it normally would be infix? Use ()
-- a + b = (+) a b
-- Want a function as infix when it would normally be prefix? Use ``
-- reduce a b = a `reduce` b
-- INTERLUDE OVER


-- Reduce right (foldr1)
reductionr :: [a] -> (a -> a -> a) -> a -- [a] can be replaced with "t a" (no quotes) for more generalisation; t stands for traversible
-- reductionr :: b -> (a -> b -> b) -> [a] -> b   -- You can actually use TWO types, because if you are taking in [String], you might want to return the sum of their lengths (Int). In that case, though, you will need an initial value for your Int (the first b). This is foldr
reductionr [x] func = x
reductionr (x:xs) func = func x (reductionr xs func)
-- reductionr ["waka", "taka", "kage"] (++)
-- "wakatakakage"

-- THIS IS WRONG: see lesson3 for correct implementation
-- Reduce left (foldl1)
reductionl :: [a] -> (a -> a -> a) -> a
reductionl [x] func = x
reductionl (x:xs) func = func (reductionl xs func) x
-- reductionl ["waka", "taka", "kage"] (++)
-- "kagetakawaka"
-- THIS IS WRONG: see lesson3 for correct implementation

-- Summation as reductionr
summation2 :: [Int] -> Int
summation2 list = reductionr list (+)
-- And with this we see why Haskell chose to put the function first. If the list is the last argument, then you can just omit it thanks to currying. And since the list (or the "data") is what we pass more often than the "function", then it makes sense for it to be omissible
