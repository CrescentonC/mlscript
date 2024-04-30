testNotSlow2 n = if n < 0 then [] else concat [ testNotSlow2 (x - 1) | x <- [1..n] ]
testNotSlow2 $ primId 23
