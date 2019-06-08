{-|  
  This file is part of the tzcalc distribution (https://github.com/xanderxylona/quotesel).
  Copyright (c) 2019 Alexander Xylona.
  
  This program is free software: you can redistribute it and/or modify  
  it under the terms of the GNU General Public License as published by  
  the Free Software Foundation, version 3.
 
  This program is distributed in the hope that it will be useful, but 
  WITHOUT ANY WARRANTY; without even the implied warranty of 
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU 
  General Public License for more details.
 
  You should have received a copy of the GNU General Public License 
  along with this program. If not, see <http://www.gnu.org/licenses/>.
-}

import Data.List

subtractlist :: Num a => [a] -> [a] -> [a]
subtractlist (x:xs) (y:ys) = (y-x:(subtractlist xs ys))
subtractlist [] [] = []

mostcommon :: Ord a => [a] -> a 
mostcommon = snd . maximum . map (\xs -> (length xs, head xs)) . group . sort

composerange :: [Int] -> [Int] -> [Int]
composerange (x:xs) (y:ys) 
    | y < x = [x..23] ++ [0..y] ++ (composerange xs ys)
    | otherwise = [x..y] ++ (composerange xs ys)
composerange [] [] = []

besttime :: [Int] -> [Int] -> [Int] -> Int
besttime tz rise fall = mostcommon wakingHours
    where wakingHours = composerange riseHours fallHours
          riseHours   = map (`mod` 23) $ subtractlist tz rise
          fallHours   = map (`mod` 23) $ subtractlist tz fall
