let unity x = x;;
let funix () = 0;;
let fgeneric () = failwith "Not implemented";;

module Hello = struct
  let message = "Hello"
  let hello () = print_endline message
end
let goodbye () = print_endline "Goodbye"
let hello_goodbye () =
  Hello.hello ();
  goodbye ()
