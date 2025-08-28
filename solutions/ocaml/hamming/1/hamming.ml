type nucleotide = A | C | G | T

let hamming_distance strand1 strand2 =
  if List.length strand1 <> List.length strand2 then
    Error "strands must be of equal length"
  else
    let rec aux s1 s2 acc =
      match (s1, s2) with
      | [], [] -> Ok acc
      | x1 :: xs1, x2 :: xs2 ->
          let acc' = if x1 <> x2 then acc + 1 else acc in
          aux xs1 xs2 acc'
      | _, _ -> Error "strands must be of equal length"
    in
    aux strand1 strand2 0
