(* Sum of first n naturals: n(n+1)/2 *)
let square_of_sum n =
  let s = n * (n + 1) / 2 in
  s * s

(* Sum of squares: n(n+1)(2n+1)/6 *)
let sum_of_squares n =
  n * (n + 1) * (2 * n + 1) / 6

let difference_of_squares n =
  square_of_sum n - sum_of_squares n
