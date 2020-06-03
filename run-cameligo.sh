#!/bin/sh

#ligo run-function types.mligo test '(Big_map.literal[(1, "hi");])' 
#ligo run-function types.mligo xy_translate  '({x=2;y=3;z=1}, {dx=3;dy=4})'
#ligo run-function id.mligo buytest '({profile=0x0501000000026869; initial_controller=(Some("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address))})'
#ligo run-function id.mligo storagetest '({identities=Big_map.literal[(1, {owner=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address); controller=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address); profile=0x0501000000026869});]; next_id=2; name_price=0tez; skip_price=333mutez})'

#ligo run-function id.mligo buy '(       { profile=0x0501000000026869; initial_controller=Some(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address)) }, {  identities=Big_map.literal[(1, {owner=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address); controller=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address); profile=0x0501000000026869});]; next_id=2; name_price=0tez; skip_price=333mutez }       )' 

#ligo dry-run id.mligo main '(Buy {profile=0x0501000000026869; initial_controller=Some(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address))})' '({  identities=Big_map.literal[(1, {owner=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address); controller=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address); profile=0x0501000000026869});]; next_id=2; name_price=0tez; skip_price=333mutez })'

#ligo compile-contract id.mligo main 
#ligo compile-storage id.mligo main '{identities=Big_map.literal[(1, {owner=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address); controller=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address); profile=0x0501000000026869});]; next_id=2; name_price=0tez; skip_price=333mutez}'
ligo compile-parameter id.mligo main 'Buy {profile=0x0501000000026869; initial_controller=Some(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address))}'
