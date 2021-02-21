addressf1=open("Ethereum/data/eth1/address1.txt","r")
addressf2=open("Ethereum/data/eth2/address2.txt","r")
addressf3=open("Ethereum/data/eth3/address3.txt","r")
addressf4=open("Ethereum/data/eth4/address4.txt","r")


address1=addressf1.read()
start=address1.find("{")+1
end=address1.find("}")
address1= "'0x"+address1[start:end]+"'"
addressf1.close()

address2=addressf2.read()
start=address2.find("{")+1
end=address2.find("}")
address2= "'0x"+address2[start:end]+"'"
addressf2.close()

address3=addressf3.read()
start=address3.find("{")+1
end=address3.find("}")
address3= "'0x"+address3[start:end]+"'"
addressf3.close()

address4=addressf4.read()
start=address4.find("{")+1
end=address4.find("}")
address4= "'0x"+address4[start:end]+"'"
addressf4.close()


switch = {"eth1":address1, "eth2":address2, "eth3":address3, "eth4":address4}
fin = open("transactions.txt", "r")
with open("transactions.sh", "w+") as fout:
        for line in fin.readlines():
            for word in switch.keys():
                if word in line:
                    line = line.replace(word, switch[word])
            fout.write(line)
fin.close()

