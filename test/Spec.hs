import Test.HUnit -- Import testing framework

import Lib -- Import file holding the functions


main :: IO ()
main = do
    result <- runTestTT allTests
    return ()

allTests :: Test 
allTests = TestList [
    testTaxNothing,
    testBaselineTax
  ]

testTaxNothing :: Test
testTaxNothing = TestCase (assertEqual "No tax is required" 0 (incomeTax 10000))

testBaselineTax :: Test
testBaselineTax = TestCase (assertEqual "The baseline tax rate" 1486 (incomeTax 20000))