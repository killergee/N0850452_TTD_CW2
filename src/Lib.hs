module Lib where

defaultUsersTakings :: Int
defaultUsersTakings = 12570

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
