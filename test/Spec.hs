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
    testAdditionallineTax,
    testNationalTaxLower,
    testNationalTaxMiddle,
    testNationalTaxHigher
  ]

testTaxNothing :: Test
testTaxNothing = TestCase (assertEqual "No tax is required" 0 (incomeTax 9050))

testBaselineTax :: Test
testBaselineTax = TestCase (assertEqual "The baseline tax rate" 4486 (incomeTax 35000))

testHigherlineTax :: Test 
testHigherlineTax = TestCase (assertEqual "The higherline tax rate" 15432 (incomeTax 70000))

testAdditionallineTax :: Test 
testAdditionallineTax = TestCase (assertEqual "The additionalline tax rate" 69932 (incomeTax 200000))

testUserTakings :: Test
testUserTakings =  TestCase (assertEqual "What the user is allowed" defaultUsersTakings (userTakings 40000))

testNationalTaxLower :: Test
testNationalTaxLower =  TestCase (assertEqual "National insurance to pay lower band " 0 (nationalInsuranceTax 7000))

testNationalTaxMiddle :: Test
testNationalTaxMiddle =  TestCase (assertEqual "National insurance to pay middle band " 3325 (nationalInsuranceTax 25000))


testNationalTaxHigher :: Test
testNationalTaxHigher =  TestCase (assertEqual "National insurance to pay high band " 7700 (nationalInsuranceTax 220000))