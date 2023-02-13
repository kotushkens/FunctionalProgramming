module Euler (
    smallestDividendByAll,
    lcmForList,
    longestRecurringWithMap,
    argMax,
    cycleLength
) where
  
import Data.List (elemIndex, foldl1')

smallestDividendByAll :: Int -> Int
smallestDividendByAll bound = helper 1 1 bound
  where
    helper n result bound
      | n > bound = result
      | result `mod` n == 0 = helper (n+1) result bound
      | otherwise = helper 1 (result+1) bound

lcmForList :: [Int] -> Int
lcmForList [] = 1
lcmForList [x] = x
lcmForList (x:xs) = lcm x (lcmForList xs)

longestRecurringWithMap :: Double -> [Double]
longestRecurringWithMap bound = [1.0 / x | x <- [2,3..bound]]

-- Length of the repeating decimal cycle of 1/n.
-- e.g. 1/4 = 0.25(0), which is length 1.
-- e.g. 1/7 = 0.(142857), which is length 6.
cycleLength :: Int -> Int
cycleLength n =
	let
		remainders = iterate (\x -> mod (x * 10) n) 1
		findCycle [] (x:xs) = findCycle (x:[]) xs
		findCycle acc (x:xs) = case elemIndex x acc of
			Nothing -> findCycle (x:acc) xs
			Just i -> i + 1
	in
		findCycle [] remainders

argMax :: Ord b => (a -> b) -> [a] -> a
argMax f = foldl1' (\x y -> if (f y) > (f x) then y else x)