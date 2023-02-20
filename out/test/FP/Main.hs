
--test1 = TestCase (assertEqual "for (foo 3)," (1,2) (smallestDivisibleByAll 3))
--
 import Test.QuickCheck

 prop_reverseReverse :: [Int] -> Bool
 prop_reverseReverse xs = reverse (reverse xs) == xs
--main :: IO ()
--main = putStrLn (assertEqual "for (foo 3)," (1,2) (smallestDivisibleByAll 3))
--putStrLn "Test suite not yet implemented"
