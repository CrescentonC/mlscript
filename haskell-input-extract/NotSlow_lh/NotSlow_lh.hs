f n ls = map (\x -> testNotSlow (n - 1)) ls
testNotSlow n = if n < 0 then [] else concat (f n [1..n])
testNotSlow $ primId 10
