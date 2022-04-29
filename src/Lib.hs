module Lib where

defaultUsersTakings :: Int
defaultUsersTakings = 12570

minimalNationalTaxLevel :: Int
minimalNationalTaxLevel = 6396

higherNationalTaxLevel :: Int
higherNationalTaxLevel = 9876

highestNationalTaxLevel :: Int
highestNationalTaxLevel = 50268

divideByOneThousand :: Int
divideByOneThousand = 1000

userTakings :: Int -> Int
userTakings income = defaultUsersTakings

incomeTax :: Int -> Int 
incomeTax income = 
    if income < userTakings income
        then 0
        else if income < 50270
            then  (income - userTakings income) `div` 5
            else if income < 150000 
                then ((50270 - userTakings income) `div` 5) + ((income - 50270) * 4) `div` 10
                else ((50270 - userTakings income) `div` 5) 
                + ((150000 - 50270) * 4) `div` 10 
                + ((income - 150000) * 45) `div` 100

nationalInsuranceTax :: Int -> Int 
nationalInsuranceTax income =
    if (income > minimalNationalTaxLevel && income < higherNationalTaxLevel)
        then 0
        else if (income > higherNationalTaxLevel && income < highestNationalTaxLevel)
            then (income * 133) `div` divideByOneThousand
            else if (income > highestNationalTaxLevel)
                then (income * 35) `div` divideByOneThousand
                else undefined