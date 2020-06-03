let () =
    Mylib.goodbye();
    Mylib.Hello.hello()

let x = (Mylib.unity 10);;
print_int x;;
print_endline "";;
let y = (Mylib.unity);;
print_int (y 100);;
