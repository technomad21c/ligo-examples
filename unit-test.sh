#!/bin/bash

SYNTAX=$1
FILE=$2
COMMAND=$3
ENTRYPOINT=$4

if [[ $COMMAND = "run-function" ]] && [[ $ENTRYPOINT = "buy" ]]
then
    echo "start testing $COMMAND for $FILE..."
    if [[ $SYNTAX = "pascaligo" ]]
    then
        ligo run-function $FILE $ENTRYPOINT '( record [ profile=0x0501000000026869; initial_controller=Some(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address)) ], record [  identities=big_map[1->record [owner=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address); controller=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address); profile=0x0501000000026869]]; next_id=2; name_price=0tez; skip_price=333mutez; ]       )'
    elif [[ $SYNTAX = "cameligo" ]]
    then
        ligo run-function $FILE $ENTRYPOINT '(       { profile=0x0501000000026869; initial_controller=Some(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address)) }, {  identities=Big_map.literal[(1, {owner=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address); controller=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address); profile=0x0501000000026869});]; next_id=2; name_price=0tez; skip_price=333mutez }       )'
    elif [[ $SYNTAX = "reasonligo" ]]
    then
        ligo run-function $FILE $ENTRYPOINT '({profile: 0x0501000000026869, initial_controller: Some(("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address))}, {identities:Big_map.literal([(1, {owner:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), controller:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address), profile:0x0501000000026869})]), next_id:2, name_price:0tez, skip_price:333mutez})'
    else
        echo "not"
    fi

elif [[ $COMMAND = "dry-run" ]]
then
    echo "string testing $COMMAND for $FILE..."
    if [[ $SYNTAX = "pascaligo" ]]
    then
        ligo dry-run $FILE $ENTRYPOINT '(Buy (  record [ profile=0x0501000000026869; initial_controller=Some(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address)) ]))' '(record [ identities=big_map[1->record [owner=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address); controller=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address); profile=0x0501000000026869]]; next_id=2; name_price=0tez; skip_price=50mutez; ])'
    elif [[ $SYNTAX = "cameligo" ]]
    then
        ligo dry-run $FILE $ENTRYPOINT '(Buy {profile=0x0501000000026869; initial_controller=Some(("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address))})' '({  identities=Big_map.literal[(1, {owner=("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address); controller=("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address); profile=0x0501000000026869});]; next_id=2; name_price=0tez; skip_price=333mutez })'

    elif [[ $SYNTAX = "reasonligo" ]]
    then
        ligo dry-run $FILE $ENTRYPOINT '(Buy( {profile: 0x0501000000026869, initial_controller: Some(("tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" : address))}))'  '({identities:Big_map.literal([(1, {owner:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx" : address), controller:("tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx": address), profile:0x0501000000026869})]), next_id:2, name_price:0tez, skip_price:333mutez})'
    else
        echo "does not support $SYNTAX! only supports PascaLIGO, CameLigo, and ReasonLigo."
    fi

elif [[ $COMMAND = "deploy" ]]
then
    echo "deploy"
else
    echo "does not support $COMMAND!"
fi
