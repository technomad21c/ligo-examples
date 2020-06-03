type commit is record [
  date        : timestamp;
  salted_hash : bytes;
]

type commit_set is big_map(address, commit)

type storage is record [
  hashed  : bytes;
  unused  : bool;
  commits : commit_set
]

type reveal is record [
  hashable : bytes;
  message  : unit -> list(operation)
]

type parameter is
  Commit of bytes
| Reveal of reveal

type return is list(operation) * storage

(* We use hash-commit so that a baker can not steal *)

function test_bytes (const p : bytes) : string is "Parameter(bytes) OK!"
function test_timestamp (const d : timestamp) : string is "Parameter(timestamp) OK!"
function test_commit (const c : commit) : string is "Parameter(commit) OK!"
function test_commit_set (const c : commit_set) : string is "Parameter(commit) OK!"
function test_storage(const s : storage) : string is "Parameter(storage) OK!"
function test_func_commit (const p : bytes; var s: storage) : string is "Function(commit) OK!"
function test_reveal (const r : reveal) : string is "Parameter(reveal) OK!"
function commit_ret (const p : bytes; var s: storage) : return is
  begin
    const commit : commit = record [date = Tezos.now + 86_400; salted_hash = p];
    const updated_map: commit_set = Big_map.update(Tezos.sender, Some(commit), s.commits);
    s := s with record [commits = updated_map];    
  end with ((nil : list(operation)), s)

function commit (const p : bytes; var s: storage) : return is
  begin
    const commit : commit = record [date = Tezos.now + 86_400; salted_hash = p];
    const updated_map: commit_set = Big_map.update(Tezos.sender, Some(commit), s.commits);
    s := s with record [commits = updated_map];    
  end with ((nil : list(operation)), s)

function reveal (const p: reveal; var s: storage) : return is
  begin
    if not s.unused
    then failwith("This contract has already been used.")
    else skip;
    var commit : commit := record [date = (0: timestamp); salted_hash = ("": bytes)];
    case Big_map.find_opt(sender, s.commits) of
    | Some (c) -> commit := c
    | None -> failwith("You have not made a commitment to hash against yet.")
    end;
    if Tezos.now < commit.date
    then failwith("It has not been 24 hours since your commit yet.");
    else skip;
    const salted : bytes =
      Crypto.sha256(
        Bytes.concat(p.hashable, Bytes.pack(sender))
      );
    if salted =/= commit.salted_hash
    then failwith("This reveal does not match your commitment.")
    else skip;
    if s.hashed = Crypto.sha256(p.hashable)
    then s := s with record [unused = False]
    else failwith("Your commitment did not match the storage hash.");
  end with (p.message(unit), s)

function main (const p: parameter; const s: storage) : return is
  case p of
  | Commit (c) -> commit (c,s)
  | Reveal (r) -> reveal (r,s)
  end
