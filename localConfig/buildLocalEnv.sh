sudo rm -r $HOME/mytestnet
sudo rm -r $HOME/.evm-lite/eth/chaindata
tendermint testnet
mv mytestnet $HOME
val_num=$1

for ((i=0 ; i<4 ; i++)){
	./preprocess.sh $i
}

for ((i=4 ; i<$val_num ; i++)){
	./addVa.sh $i
}

./modConfig.sh $1
