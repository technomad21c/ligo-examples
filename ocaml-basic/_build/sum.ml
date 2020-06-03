(* https://www.cs.cornell.edu/courses/cs3110/2019sp/textbook/data/ounit_example.html *)
let rec sum  = function 
    | [] -> 0
    | x::xs -> x + sum xs
