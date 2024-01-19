#!/bin/zsh

# Query daewy data-fixture with file path as arg
sendQueryDaewy()
{
    query=$(cat "$1")
    poetry run regelwerk-parameters --query "$query" --source-file ta7-data/FT_V2_TA7_Sammelrechnung_Bundle-modified.json | jq .
}
