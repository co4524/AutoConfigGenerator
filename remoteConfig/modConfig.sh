##################################################################
# this script is going to modify config.toml about N node val
# start port = default:1000
# node0_connect port = default:1002
#################################################################
#para1:how many val
tendermintTestnetPath=$HOME/mytestnet

mod(){
	sed -i "s/persistent_peers/$persistent_peers/g" config.toml
}

persistent_peers=$(./persistent_peers.sh $1)
echo $persistent_peers

for ((i=0 ; i<$1 ; i++)){
	cp temp.toml config.toml
	mod
	cp -f config.toml $tendermintTestnetPath/node$i/tendermint/config/.
	rm config.toml
}


