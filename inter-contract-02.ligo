type parameter is
  Increment of nat
| Decrement of nat
| Reset

type storage is unit

type return is list (operation) * storage

const dest : address = ("KT19wgxcuXG9VH4Af5Tpm1vqEKdaMFpznXT3" : address)

function proxy (const action : parameter; const store : storage): return is
  block {
    const counter : contract (parameter) =
      case (Tezos.get_contract_opt (dest) : option (contract (parameter))) of
        Some (contract) -> contract
      | None -> (failwith ("Contract not found.") : contract (parameter))
      end;
    (* Reuse the parameter in the subsequent
       transaction or use another one, `mock_param`. *)
    const mock_param : parameter = Increment (5n);
    const op : operation = Tezos.transaction (action, 0tez, counter);
    const ops : list (operation) = list [op]
  } with (ops, store)
