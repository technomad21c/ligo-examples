#!/bin/sh
#ligo run-function types.religo xy_translate '({x:1, y:1, z:1}, {dx:2, dy:2})'
#ligo run-function types.religo testbg '( Big_map.literal([(1, "hi")]))'
#ligo run-function id.religo buytest '({profile: 0x0501000000026869, initial_controller: Some(("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN"     : address))})'
#ligo run-function id.religo storagetest '({identities:Big_map.literal([(1, {owner:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), controller:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address), profile:0x0501000000026869})]), next_id:2, name_price:0tez, skip_price:333mutez})'

#ligo run-function id.religo buy '({profile: 0x0501000000026869, initial_controller: Some(("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address))}, {identities:Big_map.literal([(1, {owner:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), controller:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address), profile:0x0501000000026869})]), next_id:2, name_price:0tez, skip_price:333mutez})'
#ligo dry-run id.religo main '(Buy( {profile: 0x0501000000026869, initial_controller: Some(("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address))}))'  '({identities:Big_map.literal([(1, {owner:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), controller:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address), profile:0x0501000000026869})]), next_id:2, name_price:0tez, skip_price:333mutez})'
ligo compile-contract id.religo main
ligo compile-storage id.religo main '{identities:Big_map.literal([(1, {owner:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), controller:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address), profile:0x0501000000026869})]), next_id:2, name_price:0tez, skip_price:333mutez}'
ligo compile-parameter id.religo main 'Buy( {profile: 0x0501000000026869, initial_controller: Some(("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address))})'
