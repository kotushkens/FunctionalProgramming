module Euler
  ( smallestDividendByAll,
    lcmForList,
    argMax,
    cycleLength,
    mapList,
  )
where

import Data.List (elemIndex, foldl1')

smallestDividendByAll :: Int -> Int
smallestDividendByAll bound = helper 1 1 bound
  where
    helper n result b
      | n > b = result
      | result `mod` n == 0 = helper (n + 1) result b
      | otherwise = helper 1 (result + 1) b

lcmForList :: [Int] -> Int
lcmForList [] = 1
lcmForList [x] = x
lcmForList (x : xs) = customLcm x (lcmForList xs)
  where
    customLcm _ 0 = 0
    customLcm 0 _ = 0
    customLcm a b = abs ((a `quot` gcd a b) * b)

cycleLength :: Int -> (Int, Int)
cycleLength n =
  let remainders = iterate (\x -> mod (x * 10) n) 1
      findCycle (_ : _) [] = undefined
      findCycle [] [] = undefined
      findCycle [] (x : xs) = findCycle (x : []) xs
      findCycle acc (x : xs) = case elemIndex x acc of
        Nothing -> findCycle (x : acc) xs
        Just i -> (i + 1, n)
   in findCycle [] remainders

mapList :: [Int] -> [(Int, Int)]
mapList ls = map cycleLength ls

argMax :: (Ord a) => [(a, a)] -> (a, a)
argMax = foldl1' (\x y -> if fst y > fst x then y else x)
