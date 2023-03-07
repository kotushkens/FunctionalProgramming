import Euler

list1 :: [Int]
list1 = take 20 [1, 2 ..]

main :: IO ()
main = do
  -- What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  print (smallestDividendByAll 20)
  print (lcmForList list1)
  -- Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
  print (snd $ argMax $ take 1000 $ mapList [1 ..])
