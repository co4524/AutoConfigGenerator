#############################################################
# this script is for creating persistent_peers of config.toml
# example : $./persistent_peers 10000 3   will ouput six node
# 	    persistent_peers like this::          
#		persistent_peers = "1c2950023862c0b2cc5dddbf027b3df2627012b8@localhost:10000,43158fe1905e1969d9e7cf65f9d7b788f2031516@localhost:11000,65e6375bd35d30767d63f5fe01d1cf736e50465f@localhost:12000,b79bddf15e69e9d6cfcbecc6b217c652f81b5dd9@localhost:13000"
#############################################################

tendermintTestnetPath=$HOME/mytestnet
persistent_peers='persistent_peers = "'
dq='"'

get_peer(){
	id=$(tendermint show_node_id --home "$tendermintTestnetPath/node$1/tendermint/")
	localhost="@node$1:26656,"
	echo $id$localhost
}

for ((i=0 ; i<$1 ; i++)){

	peer=$(get_peer $i)
	persistent_peers=$persistent_peers$peer
}

persistent_peers=${persistent_peers%?}$dq
echo $persistent_peers
