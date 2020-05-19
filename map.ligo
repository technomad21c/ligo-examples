type move is int * int
type register is map (address, move)

const empty : register = map []

const moves : register = 
  map [
    ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address) -> (1,2);
    ("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address) -> (0,3)]

const my_balance : option (move) = moves [("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address)]

function convert_str_to_address (const str : string) : address is
  block {
    var temp : string := "tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN";
    const key : address = ( "tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address)
  } with key

  
