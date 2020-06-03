#!/bin/sh

#ligo run-function FA1.2.ligo test_nat '(5n)'
#ligo run-function FA1.2.ligo test_transfer '(record [address_from=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address); address_to=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address); value=10n])'
#ligo run-function FA1.2.ligo test_tokens '(big_map[("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)->100n])'
ligo run-function FA1.2.ligo test_allowances '(big_map[(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address))->10n])'


#ligo run-function hashlock.ligo test_reveal '(record [hashable=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce; message=(nil)])'
#ligo run-function hashlock.ligo test_reveal '(record [hashable=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce; message=(nil : list(operation))])'
#ligo run-function hashlock.ligo test_reveal '(record [hashable=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce; message=()])'

#ligo run-function hashlock.ligo test_bytes '(0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce)'
#ligo run-function hashlock.ligo test_timestamp '("2020-05-29T11:22:33Z" : timestamp)'
#ligo run-function hashlock.ligo test_commit '(record [date=("2020-05-29T11:22:33Z" : timestamp); salted_hash=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce])'
#ligo run-function hashlock.ligo test_commit_set '(big_map[("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)-> record [date=("2020-05-29T11:22:33Z" : timestamp); salted_hash=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce]])'
#ligo run-function hashlock.ligo test_storage '( record [ hashed=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce; unused=False; commits=big_map[("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)->record [date=("2020-05-29T11:22:33Z" : timestamp); salted_hash=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce]] ])'
#ligo run-function hashlock.ligo test_func_commit '(0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce, record [ hashed=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce; unused=False; commits=big_map[("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)->record [date=("2020-05-29T11:22:33Z" : timestamp); salted_hash=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce]] ])'
#ligo run-function hashlock.ligo commit_ret '(0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce, record [ hashed=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce; unused=False; commits=big_map[("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)->record [date=("2020-05-29T11:22:33Z" : timestamp); salted_hash=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce]] ])'
#ligo run-function hashlock.ligo commit '(0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce, record [ hashed=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce; unused=False; commits=big_map[("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)->record [date=("2020-05-29T11:22:33Z" : timestamp); salted_hash=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce]] ])'
#ligo dry-run hashlock.ligo main '(Commit (0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce))' '(record [ hashed=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce; unused=False; commits=big_map[("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)->record [date=("2020-05-29T11:22:33Z" : timestamp); salted_hash=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce]] ])'
