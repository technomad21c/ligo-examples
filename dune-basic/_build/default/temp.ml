open Foo

let () =
    Foo.goodbye();
    Foo.Hello.hello()

let x = (Foo.unity 10);;
print_int x;;
print_endline "";;
let y = (Foo.unity);;
print_int (y 100);;
