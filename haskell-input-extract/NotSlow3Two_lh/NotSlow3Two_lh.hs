testNotSlow3Two n = if n < 0 then [1] else let tmp = testNotSlow3Two (n - 1) in concat [ tmp | x <- [0..n] ]
testNotSlow3Two $ primId 8
