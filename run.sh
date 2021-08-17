#!/bin/bash

# Default password for ethereum account
PASSWORD="deepstack"

# Name of directory that will contain databases and keystore
# Make sure to change value of DATADIR in cleanup.sh if changed here
DATADIR="data_dir"

# Default port 8545 for RPC
PORT="8545"
if [ $# -ge 1 ]
    then
        PORT=$1
fi

# Creating a file containing pass to create new acc in non-interactive mode
echo $PASSWORD | tee password_file

# Creating new acc
geth --datadir "$DATADIR" account new --password password_file

# Creating Genesis Block
geth --datadir "$DATADIR" init genesis.json

geth --identity "$DATADIR" \
 --rpc --rpcport "$PORT" \
 --rpccorsdomain "*" \
 --datadir "./$DATADIR" \
 --port "30303" \
 --nodiscover \
 --rpcapi "db,eth,net,web3,personal,miner,admin" \
 --networkid 1900 --nat "any"