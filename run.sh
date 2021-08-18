#!/bin/bash

# Name of directory that will contain databases and keystore
# Make sure to change value of DATADIR in cleanup.sh and init.sh if changed here
DATADIR="./data_dir"

# Default port 8545 for RPC
PORT="8545"
if [ $# -ge 1 ]
    then
        PORT=$1
fi

# Default number of threads to use for mining
# Recommended to keep it less than or equal to number of CPU cores
MINER_THREADS=1

if ! test -d "$DATADIR"; then
	echo "Blockchain not initialized, execute init.sh first"
    exit 1
fi

geth --identity "$DATADIR" \
 --mine \
 --miner.threads "$MINER_THREADS" \
 --rpc --rpcport "$PORT" \
 --rpccorsdomain "*" \
 --datadir "./$DATADIR" \
 --port "30303" \
 --nodiscover \
 --rpcapi "db,eth,net,web3,personal,miner,admin" \
 --networkid 1900 --nat "any"
