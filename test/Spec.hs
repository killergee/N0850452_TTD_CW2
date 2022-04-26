import Test.HUnit -- Import testing framework

import Lib -- Import file holding the functions



main :: IO ()
main = do
    result <- runTestTT allTests
    return ()

allTests :: Test 
allTests = TestList [
    testTaxNothing,
    testBaselineTax,
    testHigherlineTax,
    testUserTakings,
    testAdditionallineTax
  ]

testTaxNothing :: Test
testTaxNothing = TestCase (assertEqual "No tax is required" 0 (incomeTax 10000))

testBaselineTax :: Test
testBaselineTax = TestCase (assertEqual "The baseline tax rate" 1486 (incomeTax 20000))

testHigherlineTax :: Test 
testHigherlineTax = TestCase (assertEqual "The higherline tax rate" 15432 (incomeTax 70000))

testAdditionallineTax :: Test 
testAdditionallineTax = TestCase (assertEqual "The additionalline tax rate" 69932 (incomeTax 200000))

testUserTakings :: Test
testUserTakings =  TestCase (assertEqual "What the user is allowed" defaultUsersTakings (userTakings 40000))
