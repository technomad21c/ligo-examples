#!/bin/sh

#ligo run-function map-access.ligo force_access_to_map '("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)'
#ligo run-function map-access.ligo force_access_to_bigmap '("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)'
ligo run-function map-access.ligo force_access '( Map(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)) )'
ligo run-function map-access.ligo force_access '( BigMap(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)) )'
ligo run-function map-access.ligo force_access '( GetForceMap(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)) )'
ligo run-function map-access.ligo force_access '( GetForceBigMap(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address)) )'
