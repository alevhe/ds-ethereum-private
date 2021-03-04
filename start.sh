rm -r -f Ethereum
rm -f *.js
rm -f transactions.sh

mkdir -p Ethereum/conf

mkdir -p Ethereum/data/eth1

mkdir -p Ethereum/data/eth2

mkdir -p Ethereum/data/eth3

mkdir -p Ethereum/data/eth4

mkdir -p Ethereum/data/urls

cd Ethereum

docker pull ethereum/client-go:alltools-v1.7.3

docker pull ethereum/solc:nightly

docker run --rm --name geth ethereum/client-go:alltools-v1.7.3 geth version

docker run --rm --name geth ethereum/client-go:alltools-v1.7.3 geth version

echo 'eth1' > data/eth1/eth1.txt
echo 'eth2' > data/eth2/eth2.txt
echo 'eth3' > data/eth3/eth3.txt
echo 'eth4' > data/eth4/eth4.txt


docker run -it --rm --name geth -u $(id -u $USER):$(id -g $USER) -v $HOME/Ethereum:/root ethereum/client-go:alltools-v1.7.3 geth --password /root/data/eth1/eth1.txt --datadir /root/data/eth1 account new > data/eth1/address1.txt

docker run -it --rm --name geth -u $(id -u $USER):$(id -g $USER) -v $HOME/Ethereum:/root ethereum/client-go:alltools-v1.7.3 geth --password /root/data/eth2/eth2.txt --datadir /root/data/eth2 account new > data/eth2/address2.txt

docker run -it --rm --name geth -u $(id -u $USER):$(id -g $USER) -v $HOME/Ethereum:/root ethereum/client-go:alltools-v1.7.3 geth --password /root/data/eth3/eth3.txt --datadir /root/data/eth3 account new > data/eth3/address3.txt

docker run -it --rm --name geth -u $(id -u $USER):$(id -g $USER) -v $HOME/Ethereum:/root ethereum/client-go:alltools-v1.7.3 geth --password /root/data/eth4/eth4.txt --datadir /root/data/eth4 account new > data/eth4/address4.txt


cd ..
python3 makegen.py

cp genesis.json Ethereum/conf/


docker run -it --rm --name geth -u $(id -u $USER):$(id -g $USER) -v $HOME/Ethereum:/root ethereum/client-go:alltools-v1.7.3 geth --datadir /root/data/eth1 init /root/conf/genesis.json


docker run -it --rm --name geth -u $(id -u $USER):$(id -g $USER) -v $HOME/Ethereum:/root ethereum/client-go:alltools-v1.7.3 geth --datadir /root/data/eth2 init /root/conf/genesis.json


docker run -it --rm --name geth -u $(id -u $USER):$(id -g $USER) -v $HOME/Ethereum:/root ethereum/client-go:alltools-v1.7.3 geth --datadir /root/data/eth3 init /root/conf/genesis.json


docker run -it --rm --name geth -u $(id -u $USER):$(id -g $USER) -v $HOME/Ethereum:/root ethereum/client-go:alltools-v1.7.3 geth --datadir /root/data/eth4 init /root/conf/genesis.json

echo Four new tabs will be opened, one for each account !


gnome-terminal --title "Eth1" --tab -e "docker run -it --rm --name cont1 -v $HOME/Ethereum:/root -u $(id -u $USER):$(id -g $USER) -p 8081:8081 -p 30001:30001 ethereum/client-go:alltools-v1.7.3 geth --password /root/data/eth1/eth1.txt --unlock 0 --identity "eth1" --datadir /root/data/eth1 --ethash.dagdir /root/data/eth1 --networkid "12345" --maxpeers 4 --nodiscover --rpc --rpcaddr "0.0.0.0" --rpcport 8081 --rpccorsdomain "*" --rpcapi "eth,net,web3,admin,personal" --port 30001 --verbosity 2 console"

sleep 2
docker container ls -q -l > Ethereum/data/eth1/id1.txt

gnome-terminal --title "Eth2" --tab -e "docker run -it --rm --name cont2 -v $HOME/Ethereum:/root -u $(id -u $USER):$(id -g $USER) -p 8082:8082 -p 30002:30002 ethereum/client-go:alltools-v1.7.3 geth --password /root/data/eth2/eth2.txt --unlock 0 --identity "eth2" --datadir /root/data/eth2 --ethash.dagdir /root/data/eth2 --networkid "12345" --maxpeers 4 --nodiscover --rpc --rpcaddr "0.0.0.0" --rpcport 8081 --rpccorsdomain "*" --rpcapi "eth,net,web3,admin,personal" --port 30002 --verbosity 2 console"

sleep 2
docker container ls -q -l > Ethereum/data/eth2/id2.txt

gnome-terminal --title "Eth3" --tab -e "docker run -it --rm --name cont3 -v $HOME/Ethereum:/root -u $(id -u $USER):$(id -g $USER) -p 8083:8083 -p 30003:30003 ethereum/client-go:alltools-v1.7.3 geth --password /root/data/eth3/eth3.txt --unlock 0 --identity "eth3" --datadir /root/data/eth3 --ethash.dagdir /root/data/eth3 --networkid "12345" --maxpeers 4 --nodiscover --rpc --rpcaddr "0.0.0.0" --rpcport 8081 --rpccorsdomain "*" --rpcapi "eth,net,web3,admin,personal" --port 30003 --verbosity 2 console"

sleep 2
docker container ls -q -l > Ethereum/data/eth3/id3.txt

gnome-terminal --title "Eth4" --tab -e "docker run -it --rm --name cont4 -v $HOME/Ethereum:/root -u $(id -u $USER):$(id -g $USER) -p 8084:8084 -p 30004:30004 ethereum/client-go:alltools-v1.7.3 geth --password /root/data/eth4/eth4.txt --unlock 0 --identity "eth4" --datadir /root/data/eth4 --ethash.dagdir /root/data/eth4 --networkid "12345" --maxpeers 4 --nodiscover --rpc --rpcaddr "0.0.0.0" --rpcport 8081 --rpccorsdomain "*" --rpcapi "eth,net,web3,admin,personal" --port 30004 --verbosity 2 console" 

sleep 2
docker container ls -q -l > Ethereum/data/eth4/id4.txt


echo Operation completed

#salvo ip
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$(< Ethereum/data/eth1/id1.txt)" > Ethereum/data/eth1/ip.txt

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$(< Ethereum/data/eth2/id2.txt)" > Ethereum/data/eth2/ip.txt

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$(< Ethereum/data/eth3/id3.txt)" > Ethereum/data/eth3/ip.txt

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$(< Ethereum/data/eth4/id4.txt)" > Ethereum/data/eth4/ip.txt
#salvo url
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$(< Ethereum/data/eth1/id1.txt)" > Ethereum/data/urls/url1.txt

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$(< Ethereum/data/eth2/id2.txt)" > Ethereum/data/urls/url2.txt

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$(< Ethereum/data/eth3/id3.txt)" > Ethereum/data/urls/url3.txt

docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' "$(< Ethereum/data/eth4/id4.txt)" > Ethereum/data/urls/url4.txt

python3 makeurl.py


docker exec -it cont1 geth --exec "admin.nodeInfo.enode" attach "$(< Ethereum/data/urls/url1.txt)"  > Ethereum/data/eth1/enode.txt
docker exec -it cont2 geth --exec "admin.nodeInfo.enode" attach "$(< Ethereum/data/urls/url2.txt)"  > Ethereum/data/eth2/enode.txt
docker exec -it cont3 geth --exec "admin.nodeInfo.enode" attach "$(< Ethereum/data/urls/url3.txt)"  > Ethereum/data/eth3/enode.txt
docker exec -it cont4 geth --exec "admin.nodeInfo.enode" attach "$(< Ethereum/data/urls/url4.txt)"  > Ethereum/data/eth4/enode.txt


sed -i '1s/^.....//' Ethereum/data/eth1/enode.txt
sed -i '1s/^.....//' Ethereum/data/eth2/enode.txt 
sed -i '1s/^.....//' Ethereum/data/eth3/enode.txt 
sed -i '1s/^.....//' Ethereum/data/eth4/enode.txt 

python3 addpeercreation.py


sleep 5

docker exec -it cont1 geth --exec 'loadScript("root/addpeerf1.js")' attach "$(< Ethereum/data/urls/url1.txt)"
docker exec -it cont2 geth --exec 'loadScript("root/addpeerf2.js")' attach "$(< Ethereum/data/urls/url2.txt)"
docker exec -it cont3 geth --exec 'loadScript("root/addpeerf3.js")' attach "$(< Ethereum/data/urls/url3.txt)"

python3 createtransaction.py

chmod +x transactions.sh



