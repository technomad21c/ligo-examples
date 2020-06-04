#!/bin/sh

#ligo run-function FA1.2.religo test_nat '(5n)'
#ligo run-function FA1.2.religo test_transfer '({address_from:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), address_to:("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address), value:10n})'
#ligo run-function FA1.2.religo test_tokens '(Big_map.literal([(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), 100n)]))'
#ligo run-function FA1.2.religo test_allowances '(Big_map.literal([((("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)), 10n)]))'
#ligo run-function FA1.2.religo test_storage '({tokens:Big_map.literal([(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address),100n)]), allowances:Big_map.literal([((("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)), 100n)]), total_amount:50n})'
#ligo run-function FA1.2.religo transfer '({address_from:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), address_to:("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address), value:10n}, {tokens:Big_map.literal([(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address),100n)]), allowances:Big_map.literal([((("tz1SVwdLNf3ANMQE1AXrxS1pBG8tcn2joVZg" : address), ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)), 100n)]), total_amount:100n})'
ligo dry-run FA1.2.religo main '(Transfer ({address_from:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), address_to:("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address), value:10n}))' '({tokens:Big_map.literal([(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address),100n)]), allowances:Big_map.literal([((("tz1SVwdLNf3ANMQE1AXrxS1pBG8tcn2joVZg" : address), ("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)), 100n)]), total_amount:100n})'


#ligo run-function hashlock.religo reveal '({hashable:0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce, message:()})'
#ligo run-function hashlock.ligo test_reveal '(record [hashable=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce; message=(nil : list(operation))])'
#ligo run-function hashlock.ligo test_reveal '(record [hashable=0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce; message=()])'

#ligo run-function hashlock.religo test_bigmap '( Big_map.literal([(1, "hi")]))'
#ligo run-function hashlock.religo test_bytes '(0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce)'
#ligo run-function hashlock.religo test_timestamp '(("2020-05-29T11:22:33Z" : timestamp))'
#ligo run-function hashlock.religo test_commit '{date:("2020-06-02T10:23:41Z":timestamp), salted_hash:0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce}'
#ligo run-function hashlock.religo test_commit_set '( Big_map.literal([(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), {date:("2020-06-02T10:23:41Z":timestamp), salted_hash:0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce})]))'
#ligo run-function hashlock.religo test_storage '({hashed:0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce, unused:false, commits:Big_map.literal([(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), {date:(    "2020-06-02T10:23:41Z":timestamp), salted_hash:0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce})])})'
#ligo run-function hashlock.religo commit '(0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce, {hashed:0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce, unused    :false, commits:Big_map.literal([(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), {date:(    "2020-06-02T10:23:41Z":timestamp),     salted_hash:0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce})])})'
#ligo dry-run hashlock.religo main '(Commit (0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce))' '{hashed:0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce, unused:false, commits:Big_map.literal([(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), {date:("2020-06-02T10:23:41Z":timestamp), salted_hash:0x0e2ab5866b0ec701a0204881645dc50e1d60668f1433a385e999f0af1b6cd8ce})])}'

