type parameter is N | S 

function entry_A (const n : parameter) : string is "Hello, Entry_A"
function entry_B (const s : string) : string is s

function main (const action : parameter) : string is
  case action of
    N -> entry_A(N) 
  | S -> entry_B("Hello, Entry_B")
  end

type coin is 
  Increment of int
| Decrement of string

function entry_A_2 (const n : int) : string is "Hello, Entry_A_02"
function entry_B_2 (const s : string) : string is s

function func02 (const action : coin) : string is
  case action of
    Increment (n) -> entry_A_2(n) 
  | Decrement (s) -> entry_B_2(s)
  end
