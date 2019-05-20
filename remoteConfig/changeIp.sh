path=$HOME/mytestnet/node
argc=$#
argv=($@)
for ((i=0 ; i<$1 ; i++)) {
	for ((j=0 ; j<$1 ; j++)){
		ip=${argv[j+1]}
		sed -i "s/node$j/$ip/g" $path$i/tendermint/config/config.toml	
	}
}
