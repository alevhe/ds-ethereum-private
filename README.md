# ds-ethereum-private

WORKS ONLY ON LINUX

This is a simple implementation of a private ethereum blockchain running on docker containers and accessible via the geth javascript console.

start.sh is the script for the deployement of the chain. 4 accounts will be created and one node for each of them, the nodes are fully connected with each other and with a fixed balance (100 ethers) modifiable in the presets inside the genesis.json file.

transactions.sh executes a series of 48 mixed transactions.

For more specific questions see guide.odt.

requirements : python3
