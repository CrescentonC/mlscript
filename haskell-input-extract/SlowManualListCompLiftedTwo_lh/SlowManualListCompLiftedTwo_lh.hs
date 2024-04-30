lscompf x n = case x of { [] -> []; (h:t) -> (testSlowManualListCompLiftedTwo (n - 1)):(lscompf t n) }
testSlowManualListCompLiftedTwo n =
  if n < 0 then
    [1]
  else
    concat ( lscompf [0..n] n )
testSlowManualListCompLiftedTwo $ primId 8
