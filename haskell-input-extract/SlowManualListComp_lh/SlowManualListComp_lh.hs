testSlowManualListComp n =
  if n < 0 then
    []
  else
    concat (
      let lscompf =
            \x -> case x of { [] -> []; (h:t) -> (testSlowManualListComp (n - 1)):(lscompf t) }
      in
      lscompf [1..n]
    )
testSlowManualListComp $ primId 10
