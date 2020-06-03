open Format
open Lib

let ret = Hello.Hello.message
let () = 
  printf "Hello, %s world\n%!" "cruel";
  printf "Hello, %d times!\n%!" 42;
  printf "%s\n%!" ret

(* let test_hash_raw = sha_256_hash (Bytes.of_string "hello world") *)
