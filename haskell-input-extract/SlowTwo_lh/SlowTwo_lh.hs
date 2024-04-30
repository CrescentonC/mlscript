testSlowTwo n = if n < 0 then [1] else concat [ testSlowTwo (n - 1) | x <- [0..n] ]
testSlowTwo $ primId 8
