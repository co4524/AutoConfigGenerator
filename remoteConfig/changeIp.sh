path=$HOME/mytestnet/node
nodeNum=$1
base=$2
for ((i=0 ; i<$1 ; i++)) {
	ip=$3
	for ((j=0 ; j<$1 ; j++)){
		#echo $base.$ip
		sed -i "s/node$j/$base.$ip/g" $path$i/tendermint/config/config.toml
		let ip=ip+1	
	}
}
