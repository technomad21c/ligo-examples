const date : timestamp = ("2020-05-29T11:22:33Z" : timestamp);

function test (const m : string) :string is  "OK!"

type prof is
  record [
    profile : bytes;
  ]

function buy (const p : bytes ) : bytes is 
  block {
    const ret : bytes = p
  } with ret

const t : tez = 5tez
function transfer (const money : tez) : tez is 
  block {
    var total : tez := t + money
  } with total

const addr : address = ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)
function youraddr (const d : address) : address is (d: address)

const bg : big_map(int, string) = big_map [1 -> "one"]
function bgtest (const bgt : big_map(int, string)) : string is "OK!"

type id is int
 
type id_details is
  record [
    owner: address;
    controller: address;
    profile: bytes;
  ]

type storage is
  record [
    identities: big_map (id, id_details);
    next_id: int;   
    name_price: tez;
    skip_price: tez;
  ]

function storagetest (const strg : storage) : string is "OK!" 

type buy is
  record [
    profile: bytes;
    initial_controller: option(address);
  ]

type update_owner is
  record [
    id: id;
    new_owner: address;
  ]

type update_details is
  record [
    id: id;
    new_profile: option(bytes);
    new_controller: option(address);
  ]

type action is
   | Buy of buy
   | Update_owner of update_owner 
   | Update_details of update_details
   | Skip of unit

function actiontest (const act : action) : string is "OK!"
