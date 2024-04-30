f n ls = map (\x -> testNotSlowTwo (n - 1)) ls
testNotSlowTwo n = if n < 0 then [1] else concat (f n [0..n])
testNotSlowTwo $ primId 10
