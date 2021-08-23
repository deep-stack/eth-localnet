#!/bin/bash

# Default password for ethereum account
PASSWORD="deepstack"

# Name of directory that will contain databases and keystore
# Make sure to change value of DATADIR in cleanup.sh and run.sh if changed here
DATADIR="./data_dir"

if test -d "$DATADIR"; then
	echo "Blockchain already initialized, execute run.sh to start mining"
    exit 0
fi

# Creating a file containing pass to create new acc in non-interactive mode
echo $PASSWORD | tee password_file

# Creating new acc
geth --datadir "$DATADIR" account new --password password_file

# Creating Genesis Block
geth --datadir "$DATADIR" init genesis.json