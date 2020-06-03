#!/bin/sh
#ligo run-function types.ligo actiontest '(record [  identities=big_map[1->record [owner=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address); controller=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address); profile=0x0501000000026869]]; next_id=2; name_price=100mutez; skip_price=333mutez;])'
ligo dry-run id.ligo main '(Buy (  
  record [
    profile=0x0501000000026869;
    initial_controller=Some(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address))
  ]
)
)' '(record [
  identities=big_map[1->record [owner=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address);
  controller=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address); profile=0x0501000000026869]];
  next_id=2; 
  name_price=0tez;
  skip_price=50mutez;
]
)'
