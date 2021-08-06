#!/bin/bash

# Default port 8545 for RPC
PORT="8545"
if [ $# -ge 1 ]
    then
        PORT=$1
fi

# Creating genesis.json
echo '{
        "config": {
                "chainId": 15,
                "homesteadBlock": 0,
                "eip155Block": 0,
                "eip158Block": 0,
                "eip150Block": 0
        },
        "difficulty": "0",
        "gasLimit": "21000",
        "alloc" : {

        }
}' | tee genesis.json

# Creating a file containing pass to create new acc in non-interactive mode
echo "Your_Password" | tee temp_file

# Creating new acc
geth --datadir "node00" account new --password temp_file

# Creating Genesis Block
geth --datadir "node00" init genesis.json

printf "\n\n"
echo "***********************************************************************"
echo "*                                                                     *"
echo "*                                                                     *"
echo "*     Starting the Blockchain 🔗, Make sure to use Ctrl+C to stop     *"
echo "*                                                                     *"
echo "*                                                                     *"
echo "***********************************************************************"
printf "\n\n"

geth --identity "node00" \
 --rpc --rpcport "$PORT" \
 --rpccorsdomain "*" \
 --datadir "./node00" \
 --port "30303" \
 --nodiscover \
 --rpcapi "db,eth,net,web3,personal,miner,admin" \
 --networkid 1900 --nat "any"
