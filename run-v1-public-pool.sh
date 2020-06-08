#!/bin/sh

#ligo dry-run v1-public-pool.ligo  --amount 1.55 main "Deposit(unit)" "record liquidity=0mutez; end"
#ligo dry-run v1-public-pool.ligo --amount 1.55 main "Deposit(unit)" "record liquidity=0mutez; end"
ligo dry-run v1-public-pool.ligo main "Withdraw(unit)" "record liquidity=10000mutez; end"
