#create eth dir for node
#create tendermint dir for node
tendermintTestnetPath=$HOME/mytestnet
mkdir $tendermintTestnetPath/node$1/tendermint
cp -r $HOME/.evm-lite/eth $tendermintTestnetPath/node$1/.
mv $tendermintTestnetPath/node$1/config $tendermintTestnetPath/node$1/tendermint
mv $tendermintTestnetPath/node$1/data $tendermintTestnetPath/node$1/tendermint
