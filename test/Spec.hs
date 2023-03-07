import Test.HUnit
import Euler

smallestDividendByAllTest :: Test 
smallestDividendByAllTest = TestCase (assertEqual "smallestDividendByAllTest" 232792560 (smallestDividendByAll 20))

lcmForListTest :: Test 
lcmForListTest = TestCase (assertEqual "lcmForListTest" 232792560 (lcmForList [1..20]))

cycleLengthTest :: Test
cycleLengthTest = TestCase (assertEqual "cycleLengthTest" (7,6) (cycleLength 7))

argMaxTest :: Test
argMaxTest = TestCase (assertEqual "argMaxTest" 983 (snd $ argMax $ take 1000 $ mapList [1..]))

tests :: Test
tests = TestList ["smallestDividendByAllTest returns correct result" ~: smallestDividendByAllTest,
                  "lcmForListTest returns correct result" ~: lcmForListTest,
                  "cycleLength returns correct result" ~: cycleLengthTest,
                  "cycleLength argMax return is correct" ~: argMaxTest]

main :: IO Counts
main = do
  runTestTT tests