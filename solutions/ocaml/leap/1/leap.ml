let leap_year year =
  (year mod 400 = 0) ||
  ((year mod 4 = 0) && (year mod 100 <> 0))

let () =
  if Array.length Sys.argv < 2 then
    print_endline "Usage: ./a.out <year>"
  else
    let year = int_of_string Sys.argv.(1) in
    if leap_year year then
      Printf.printf "%d is a leap year\n" year
    else
      Printf.printf "%d is not a leap year\n" year
