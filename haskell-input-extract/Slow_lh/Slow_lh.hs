testSlow n = if n < 0 then [] else concat [ testSlow (n - 1) | x <- [1..n] ]
testSlow $ primId 10
