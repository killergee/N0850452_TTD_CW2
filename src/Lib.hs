module Lib where

incomeTax :: Int -> Int 
incomeTax income = 
    if income < 12570
        then 0
        else (income - 12570) `div` 5
