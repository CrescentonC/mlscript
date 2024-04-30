lscompf x n = case x of { [] -> []; (h:t) -> (testSlowManualListCompLifted (n - 1)):(lscompf t n) }
testSlowManualListCompLifted n =
  if n < 0 then
    []
  else
    concat ( lscompf [1..n] n )
testSlowManualListCompLifted $ primId 10
