testSlowManualListCompTwo n =
  if n < 0 then
    [1]
  else
    concat (
      let lscompf =
            \x -> case x of { [] -> []; (h:t) -> (testSlowManualListCompTwo (n - 1)):(lscompf t) }
      in
      lscompf [0..n]
    )
testSlowManualListCompTwo $ primId 8
