const greeting : string = "Hello, World"
const greeting2 : string = "Hello, World 2";

function helloworld (const a : int) : string is 
  block {
    var greeting2 : string := "Hello, World";
    var greeting3 : string := "greeting 3";
    var greeting4 : string := "greeting 4"
  } with greeting2

function helloworld2 (const a : int; const b : string) : string is 
  block {
    var greeting4 : string := "greeting 4";
    const  c : int = 1;
    const  d : int = 2;
    var greeting2 : string := "Hello, World 2";
  } with greeting2
