addpeerf1=open("addpeerf1.js","w+")
addpeerf2=open("addpeerf2.js","w+")
addpeerf3=open("addpeerf3.js","w+")

enode2f=open("Ethereum/data/eth2/enode.txt","r")
ip2f=    open("Ethereum/data/eth2/ip.txt","r")
enode3f=open("Ethereum/data/eth3/enode.txt","r")
ip3f=    open("Ethereum/data/eth3/ip.txt","r")
enode4f=open("Ethereum/data/eth4/enode.txt","r")
ip4f=    open("Ethereum/data/eth4/ip.txt","r")

ip2=ip2f.read().rstrip()
ip3=ip3f.read().rstrip()
ip4=ip4f.read().rstrip()

enode2 = enode2f.read()
start1=enode2.find("\"")+1
end1=enode2.find("[")+1
start2=enode2.find("]")
end2=enode2.find("\"", 2)
addpeer2="admin.addPeer('" + enode2[start1:end1] + ip2 + enode2[start2:end2] + "')"
adpeer2= addpeer2.replace('-','')
adpeer2= addpeer2.replace('\n','')


enode3 = enode3f.read()
start1=enode3.find("\"")+1
end1=enode3.find("[")+1
start2=enode3.find("]")
end2=enode3.find("\"", 2)
addpeer3="admin.addPeer('" + enode3[start1:end1] + ip3 + enode3[start2:end2] + "')"
adpeer3= addpeer3.replace('-','')
adpeer3= addpeer3.replace('\n','')

enode4 = enode4f.read()
start1=enode4.find("\"")+1
end1=enode4.find("[")+1
start2=enode4.find("]")
end2=enode4.find("\"", 2)
addpeer4="admin.addPeer('" + enode4[start1:end1] + ip4 + enode4[start2:end2] + "')"
adpeer4= addpeer4.replace('-','')
adpeer4= addpeer4.replace('\n','')

addpeerf1=addpeerf1.writelines(addpeer2 + "\n" + addpeer3 + "\n" + addpeer4)
addpeerf2=addpeerf2.writelines(addpeer3 + "\n" + addpeer4)
addpeerf3=addpeerf3.writelines(addpeer4)


