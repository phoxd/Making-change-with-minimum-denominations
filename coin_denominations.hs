import Debug.Trace (trace)
import Data.Array (array, listArray, (!), range)

greedyDenom :: [Int] -> Int -> [Int]
greedyDenom [] n = if n == 0 then [] else error $ "Not possible"
greedyDenom (x:xs) n
  | n >= x = x : greedyDenom (x:xs) (n - x)
  | otherwise = greedyDenom xs n

optDenom :: [Int] -> Int -> [[Int]]  
optDenom (x:xs) n = case greedyDenom (x:xs) n of
  d -> d : (greedyDenom xs n):[]
  _ -> []

pickOpt :: [[Int]] -> [Int]
pickOpt (x:xs) = go xs x
  where go [] min = min
        go (y:ys) min = go ys (if length y < length min then y else min)

pick n = pickOpt $ optDenom [7, 5, 4, 1] n


-- Step 2 algo

denom :: (Int, Int) -> [Int] -> Int
denom (_, 0) _ = 0
denom (0, _) _ = (maxBound :: Int) - 1000
denom (i, j) di
  | v > j = denom (i-1, j) di
  | otherwise = min (denom (i-1, j) di) (1 + denom (i, j-v) di)
  where v = di !! (i - 1)

t s = denom (length xs, s) xs where xs = [100, 25, 10, 5, 1]

-- src https://stackoverflow.com/questions/49473764/making-change-with-minimum-denominations-with-memoization/49556862#49556862

myMin :: Ord a => Maybe a -> Maybe a -> Maybe a
myMin (Just a) (Just b) = Just $ min a b
myMin Nothing x = x
myMin x Nothing = x

minCoinCoint :: Int -> [Int] -> Maybe Int
minCoinCoint target denoms = res (target, length denoms)
  where
    denomArray = listArray (0, length denoms) (0:denoms)
    myArrayBounds = ((0, 0), (target, length denoms))
    myArray = array myArrayBounds [(i, res i) | i <- range myArrayBounds]
    res (_, 0) = Nothing
    res (0, _) = Just 0
    res (t, d) = let dval = denomArray ! d
                     prev1 = myArray ! (t, d-1)
                     prev2 = if t >= dval
                             then (+1) <$> (myArray ! (t-dval, d))
                             else Nothing
                 in myMin prev1 prev2
