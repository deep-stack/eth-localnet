# Eth-Localnet

* Script to start a private local Ethereum Node

* Ensure that `geth` is installed

* Feel free to tweak the difficulty in genesis.json before running `init.sh`

* Ether can be pre-allocated by adding addresses with ethers to `alloc` in `genesis.json`

## Usage :

* Run this for the first time
```bash
./init.sh
```
* Run this to start mining
```bash 
./run.sh [RPC_PORT]
```

* Port number is an optional cmd line arg, default is `8545`

* Run this to delete the blockcahin
```bash 
./cleanup.sh
```
