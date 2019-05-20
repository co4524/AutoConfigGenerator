######################################################################################################
# for local
# this script file is to add a new validator to genesis.json and brocast the genesis.json to every node
# dep : tendermint testnet && preprocess
# $HOME : default path (/home/caideyi)
# new tendermint validator dir : default path ($HOME/.tendermint)
# use $tendermint testnet    to generate mytestnet file
# tendermint testnet dir with four node0-3: default path ($HOME/mytestnet)
# eth dir path : default path ($HOME/.evm-lite/eth)
# example: $./addVal 5  //add val node5 to genesis.json 
#######################################################################################################

#default para
tendermintPath=$HOME/.tendermint
tendermintTestnetPath=$HOME/mytestnet
ethPath=$HOME/.evm-lite/eth

#new val
tendermint init
#make new val dir in mytestnet dir
mkdir $tendermintTestnetPath/node$1
cp -r $ethPath $tendermintTestnetPath/node$1/.
#update the genesis.json file, add a val in
cp -f $tendermintTestnetPath/node0/tendermint/config/genesis.json $tendermintPath/config/.
touch $tendermintPath/Val.txt
sed -n '1,6p' $tendermintPath/config/priv_validator_key.json >> $tendermintPath/Val.txt
cat ./tmp.txt >> $tendermintPath/Val.txt
sed -i "s/noder/node$1/g" $tendermintPath/Val.txt
sed -i '$d' $tendermintPath/config/genesis.json
sed -i '$d' $tendermintPath/config/genesis.json
sed -i '$d' $tendermintPath/config/genesis.json
sed -i '$d' $tendermintPath/config/genesis.json
echo "    }," >> $tendermintPath/config/genesis.json
cat $tendermintPath/Val.txt >> $tendermintPath/config/genesis.json
#brocast the genesis.json file
for ((i=0;i<$1;i++))
	do
		cp -f $tendermintPath/config/genesis.json $tendermintTestnetPath/node$i/tendermint/config/.
	done

cp -r $tendermintPath $tendermintTestnetPath/node$1/tendermint
rm -r $tendermintPath
