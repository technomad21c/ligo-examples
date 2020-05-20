type parameter is
  Add of int
| Subtract of int
type storage is 
  record [
    id: int;
    points: int;
  ]
type return is list (operation) * storage
function add (const n : int; const store : storage) : storage is store with record [id = store.id; points = store.points + n]
function sub (const n : int; const store : storage) : storage is store with record [id = store.id; points = store.points - n]
function main (const action : parameter; const store : storage) : return is
  ((nil : list(operation)),
   case action of
     Add (n) -> add (n, store)
   | Subtract (n) -> sub (n, store)
   end)
