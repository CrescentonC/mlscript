testNotSlow3 n = if n < 0 then [] else let tmp = testNotSlow3 (n - 1) in concat [ tmp | x <- [1..n] ]
testNotSlow3 $ primId 10
