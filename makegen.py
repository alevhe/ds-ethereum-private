genesis= open("genesis.json","r")
addressf1=open("Ethereum/data/eth1/address1.txt","r")
addressf2=open("Ethereum/data/eth2/address2.txt","r")
addressf3=open("Ethereum/data/eth3/address3.txt","r")
addressf4=open("Ethereum/data/eth4/address4.txt","r")

address1=addressf1.read()
start=address1.find("{")+1
end=address1.find("}")
address1= address1[start:end]
addressf1.close()

address2=addressf2.read()
start=address2.find("{")+1
end=address2.find("}")
address2= address2[start:end]
addressf2.close()

address3=addressf3.read()
start=address3.find("{")+1
end=address3.find("}")
address3= address3[start:end]
addressf3.close()

address4=addressf4.read()
start=address4.find("{")+1
end=address4.find("}")
address4= address4[start:end]
addressf4.close()

lines=genesis.readlines()
lines[16]='\t"'+address1+'"'+": {\n"
lines[19]='\t"'+address2+'"'+": {\n"
lines[22]='\t"'+address3+'"'+": {\n"
lines[25]='\t"'+address4+'"'+": {\n"

genesis=open("genesis.json","w")
genesis.writelines(lines)
genesis.close()

