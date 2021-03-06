(*_*
  name: FA1.2 (CameLIGO)
  language: cameligo
  compile:
    entrypoint: main
  dryRun:
    entrypoint: main
    parameters: |
      Transfer (
      
        address_from=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address);
            address_to=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address);
            value=10n
        }
      )
    storage: |
      { tokens=Big_map.literal[(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address),100n)];
        allowances=Big_map.literal([((("tz1SVwdLNf3ANMQE1AXrxS1pBG8tcn2joVZg" : address), ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)), 100n)]);
        total_amount=100n
      }
  deploy:
    entrypoint: main
    storage: |
      { tokens=Big_map.literal[(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address),100n)];
        allowances=Big_map.literal([((("tz1SVwdLNf3ANMQE1AXrxS1pBG8tcn2joVZg" : address), ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)), 100n)]);
        total_amount=100n
      }
  evaluateValue:
    entrypoint: ""
  evaluateFunction:
    entrypoint: transfer
    parameters: |       
      { address_from=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address);
        address_to=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address);
        value=10n
      },  
      { tokens=Big_map.literal[(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address),100n)];
        allowances=Big_map.literal([((("tz1SVwdLNf3ANMQE1AXrxS1pBG8tcn2joVZg" : address), ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)), 100n)]);
        total_amount=100n
      }
  generateDeployScript:
    tool: tezos-client
    entrypoint: main
    storage: |
      { tokens=Big_map.literal[(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address),100n)];
        allowances=Big_map.literal([((("tz1SVwdLNf3ANMQE1AXrxS1pBG8tcn2joVZg" : address), ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)), 100n)]);
        total_amount=100n
      }
*_*)

type tokens = (address, nat) big_map
type allowances = (address * address, nat) big_map (* (sender,account) -> value *)

type storage = {
  tokens      : tokens;
  allowances  : allowances;
  total_amount : nat;
}

type transfer = {
    address_from : address;
    address_to   : address;
    value        : nat;
}

type approve = {
    spender : address;
    value   : nat;
}

type getAllowance = {
    owner    : address;
    spender  : address;
    callback : nat contract;
}

type getBalance = {
    owner    : address;
    callback : nat contract;
}

type getTotalSupply = {
    callback : nat contract;
}

type action =
      Transfer       of transfer
|	Approve        of approve
|	GetAllowance   of getAllowance
|	GetBalance     of getBalance
|	GetTotalSupply of getTotalSupply

let transfer (p,s : transfer * storage) : operation list * storage =
   let new_allowances =   
        if Tezos.sender = p.address_from then s.allowances
        else
            let authorized_value = match Big_map.find_opt (Tezos.sender,p.address_from) s.allowances with
                Some value -> value
            (*  None       -> 0n *)
            |	None       -> 100n (* just for web ide demonstration *)
            in
            if (authorized_value < p.value)
            then (failwith "Not Enough Allowance" : allowances)
            else Big_map.update (Tezos.sender,p.address_from) (Some (abs(authorized_value - p.value))) s.allowances
   in    
    let sender_balance = match Big_map.find_opt p.address_from s.tokens with
        Some value -> value
    |	None        -> 0n
    in
    if (sender_balance < p.value)
    then (failwith "Not Enough Balance" : operation list * storage)
    else
        let new_tokens = Big_map.update p.address_from (Some (abs(sender_balance - p.value))) s.tokens in
        let receiver_balance = match Big_map.find_opt p.address_to s.tokens with
            Some value -> value
        |	None        -> 0n
        in
        let new_tokens = Big_map.update p.address_to (Some (receiver_balance + p.value)) new_tokens in
        ([]:operation list), {s with tokens = new_tokens; allowances = new_allowances}

let approve (p,s : approve * storage) : operation list * storage =
    let previous_value = match Big_map.find_opt (p.spender, Tezos.sender) s.allowances with
        Some value -> value
    |	None -> 0n
    in
    if previous_value > 0n && p.value > 0n
    then (failwith "Unsafe Allowance Change" : operation list * storage)
    else
        let new_allowances = Big_map.update (p.spender, Tezos.sender) (Some (p.value)) s.allowances in
        ([] : operation list), {s with allowances = new_allowances}

let getAllowance (p,s : getAllowance * storage) : operation list * storage =
    let value = match Big_map.find_opt (p.owner, p.spender) s.allowances with
        Some value -> value
    |	None -> 0n
    in
    let op = Tezos.transaction value 0mutez p.callback in
    ([op],s)

let getBalance (p,s : getBalance * storage) : operation list * storage =
    let value = match Big_map.find_opt p.owner s.tokens with
        Some value -> value
    |	None -> 0n
    in
    let op = Tezos.transaction value 0mutez p.callback in
    ([op],s)

let getTotalSupply (p,s : getTotalSupply * storage) : operation list * storage =
  let total = s.total_amount in
  let op    = Tezos.transaction total 0mutez p.callback in
  ([op],s)


let main (a,s:action * storage) = 
     match a with
       Transfer p -> transfer (p,s)
    |	Approve  p -> approve (p,s)
    |	GetAllowance p -> getAllowance (p,s)
    |  GetBalance p -> getBalance (p,s)
    |	GetTotalSupply p -> getTotalSupply (p,s)
