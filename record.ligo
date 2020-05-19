// source: https://ligolang.org/docs/language-basics/maps-records

type user is 
  record [
    id : nat;
    is_admin : bool;
    name : string
  ]

const alice : user = 
  record [
    id = 1n;
    is_admin = True;
    name = "Alice"
  ]

const alice_admin : bool = alice.is_admin

