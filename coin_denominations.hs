

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

pick n = pickOpt $ optDenom denoms n

denoms :: [Int]
denoms = reverse [1, 4, 5, 7]
