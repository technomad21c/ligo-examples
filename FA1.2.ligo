type tokens     is big_map (address, nat)
type allowances is big_map (address * address, nat) (* (sender,account) -> value *)

type storage is record [
  tokens      : tokens;
  allowances  : allowances;
  total_amount : nat;
]

type transfer is record [
	address_from : address;
	address_to   : address;
	value        : nat;
]

type approve is record [
	spender : address;
	value   : nat;
]

type getAllowance is record [
	owner    : address;
	spender  : address;
	callback : contract (nat);
]

type getBalance is record [
	owner    : address;
	callback : contract (nat);
]

type getTotalSupply is record [
	callback : contract (nat);
]

type action is
  	Transfer       of transfer
|	Approve        of approve
|	GetAllowance   of getAllowance
|	GetBalance     of getBalance
|	GetTotalSupply of getTotalSupply

function test_nat (const p : nat) : string is "Parameter(nat) OK!"
function test_transfer (const t : transfer) : string is "Parameter(transfer) OK!"
function test_tokens (const t : tokens) : string is "Parameter(tokens) OK!"
function test_allowances (const a : allowances) : string is "Parameter(allowances) OK!"

function transfer (const p : transfer; const s: storage) : list (operation) * storage is block {
   var new_allowances : allowances := Big_map.empty;
	if Tezos.sender = p.address_from
	then { new_allowances := s.allowances; }
	else {
		var authorized_value : nat := 
		case (Big_map.find_opt ((Tezos.sender,p.address_from), s.allowances)) of
				Some (value) -> value
			|	None       -> 0n
		end;
		if (authorized_value < p.value)
		then { failwith("Not Enough Allowance")}
		else { new_allowances := Big_map.update ((Tezos.sender,p.address_from), (Some (abs(authorized_value - p.value))), s.allowances) }    
	};
	var sender_balance : nat := case (Big_map.find_opt (p.address_from, s.tokens)) of
		Some (value) -> value
	|	None        -> 0n
	end;
	var new_tokens : tokens := Big_map.empty;
	if (sender_balance < p.value)
	then { failwith ("Not Enough Balance")}
	else {
		new_tokens := Big_map.update (p.address_from, (Some (abs(sender_balance - p.value))), s.tokens);
		var receiver_balance : nat := case (Big_map.find_opt (p.address_to, s.tokens)) of
			Some (value) -> value
		|	None        -> 0n
		end;
		new_tokens := Big_map.update (p.address_to, (Some (receiver_balance + p.value)), new_tokens);
	}
} with ((nil: list (operation)), s with record [tokens = new_tokens; allowances = new_allowances])

function approve (const p : approve; const s : storage) : list (operation) * storage is block {
	var previous_value : nat := case Big_map.find_opt ((p.spender, Tezos.sender), s.allowances) of
		Some (value) -> value
	|	None -> 0n
	end;
	var new_allowances : allowances := Big_map.empty;
	if previous_value > 0n and p.value > 0n
	then { failwith ("Unsafe Allowance Change")}
	else {
		new_allowances := Big_map.update ((p.spender, Tezos.sender), (Some (p.value)), s.allowances);
	}
} with ((nil: list (operation)), s with record [allowances = new_allowances])

function getAllowance (const p : getAllowance; const s : storage) : list (operation) * storage is block {
	var value : nat := case Big_map.find_opt ((p.owner, p.spender), s.allowances) of
		Some (value) -> value
	|	None -> 0n
	end;
	var op : operation := Tezos.transaction (value, 0mutez, p.callback);
} with (list [op],s)

function getBalance (const p : getBalance; const s : storage) : list (operation) * storage is block {
	var value : nat := case Big_map.find_opt (p.owner, s.tokens) of
		Some (value) -> value
	|	None -> 0n
	end;
	var op : operation := Tezos.transaction (value, 0mutez, p.callback);
} with (list [op],s)

function getTotalSupply (const p : getTotalSupply; const s : storage) : list (operation) * storage is block {
  var total : nat := s.total_amount;
  var op : operation := Tezos.transaction (total, 0mutez, p.callback);
} with (list [op],s)


function main (const a : action; const s : storage) : list (operation) * storage is
 	case a of
   	Transfer       (p) -> transfer (p,s)
	|	Approve        (p) -> approve (p,s)
	|	GetAllowance   (p) -> getAllowance (p,s)
	|  GetBalance     (p) -> getBalance (p,s)
	|	GetTotalSupply (p) -> getTotalSupply (p,s)
	end;
