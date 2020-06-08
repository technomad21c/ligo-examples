
type money is nat

type wallet_map is map (address, money)
const wallets_map : wallet_map =
  map [
    ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address) -> 100n;
    ("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address) -> 200n]

type wallet_bigmap is big_map (address, money)
const wallets_bigmap : wallet_bigmap = 
  big_map [
    ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address) -> 300n;
    ("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address) -> 400n]

type action is 
  Map    of address
| BigMap of address
| GetForceMap of address
| GetForceBigMap of address

function force_access_to_map (const key : address) : money is
  case wallets_map[key] of
    Some (money) -> money
  | None -> (failwith ("No address.") : money)
  end  

function force_access_to_bigmap (const key : address) : money is
  case wallets_bigmap[key] of
    Some (money) -> money
  | None -> (failwith ("No address.") : money)
  end

function get_force_to_map (const key : address) : money is
  get_force(key, wallets_map)  

function get_force_to_bigmap (const key : address) : money is
  get_force(key, wallets_bigmap)  

function force_access (const p : action) : money  is 
block {
  skip;
}  
with case p of 
    | Map(n)  -> force_access_to_map(n)
    | BigMap(n) -> force_access_to_bigmap(n)  
    | GetForceMap(n)  -> get_force_to_map(n)
    | GetForceBigMap(n)  -> get_force_to_bigmap(n)
end

