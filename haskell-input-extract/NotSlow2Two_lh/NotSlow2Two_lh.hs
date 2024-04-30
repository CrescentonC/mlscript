testNotSlow2Two n = if n < 0 then [1] else concat [ testNotSlow2Two (x - 1) | x <- [0..n] ]
testNotSlow2Two $ primId 15
