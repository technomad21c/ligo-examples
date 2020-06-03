open Lib

let () =
    let result = Math.add 2 3 in
    print_endline(string_of_int result);
    
    let result = Math.sub 3 1 in
    print_endline(string_of_int result);

    Hello.Hello.hello();

(*    let sha_256_hash pl =
 *    let open Proto_alpha_utils.Memory_proto_alpha.Alpha_environment in
 *    Raw_hashes.sha256 pl
 *)
    let make_e ?(loc = Location.generated) expression_content =
      let location = loc in
      { expression_content; location } in

    let e_bytes_raw ?loc (b: bytes) : expression =
        make_e ?loc @@ E_literal (Literal_bytes b) in
    let test_hash_raw = Memory_proto_alpha.Alpha_environment.Raw_hashes.sha256 (Bytes.of_string "hello world")  in
    let test_hash = e_bytes_raw test_hash_raw in
    print_endline Bytes.of_string "hello world";
