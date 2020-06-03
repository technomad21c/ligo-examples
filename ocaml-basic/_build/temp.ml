open OUnit2
let ()  = 
    Foo.funix ();
    Foo.unity x

(* let test_hash_raw = sha_256_hash (Bytes.of_string "hello world")
 *print_string test_hash_raw 
 *)


let test1 test_ctxt = assert_equal "y" (x "x") ;;
let test2 test_ctxt = assert_equal 10 (x 100) ~printer:string_of_int;;


let suite = 
    "suite">:::
    ["test1">:: test1;
     "test2">:: test2]
;;

let () =
    run_test_tt_main suite
;;
