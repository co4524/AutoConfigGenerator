##################################################################
# this script is going to modify config.toml about N node val
# start port = default:1000
# node0_connect port = default:1002
#################################################################
#para1:how many val
port=1000
connect_port=$(($port+2))
echo $connect_port
tendermintTestnetPath=$HOME/mytestnet

mod(){
	sed -i "s/26658/$1/g" config.toml
	tmp=$(($1+1))
	sed -i "s/26657/$tmp/g" config.toml
	tmp=$(($tmp+1))
	sed -i "s/26656/$tmp/g" config.toml
	tmp=$(($tmp+1))
	sed -i "s/26660/$tmp/g" config.toml
	sed -i "s/persistent_peers/$persistent_peers/g" config.toml
}

persistent_peers=$(./persistent_peers.sh $connect_port $1)
echo $persistent_peers

for ((i=0 ; i<$1 ; i++)){
	cp temp.toml config.toml
	mod $port
	port=$(($port+1000))
	cp -f config.toml $tendermintTestnetPath/node$i/tendermint/config/.
	rm config.toml
}


