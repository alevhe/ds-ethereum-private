urlf1=open("Ethereum/data/urls/url1.txt","r")
urlf2=open("Ethereum/data/urls/url2.txt","r")
urlf3=open("Ethereum/data/urls/url3.txt","r")
urlf4=open("Ethereum/data/urls/url4.txt","r")

url1="http://"+urlf1.read().rstrip()+":8081"
url2="http://"+urlf2.read().rstrip()+":8081"
url3="http://"+urlf3.read().rstrip()+":8081"
url4="http://"+urlf4.read().rstrip()+":8081"



urlf1.close()
urlf2.close()
urlf3.close()
urlf4.close()

urlf1=open("Ethereum/data/urls/url1.txt","w")
urlf2=open("Ethereum/data/urls/url2.txt","w")
urlf3=open("Ethereum/data/urls/url3.txt","w")
urlf4=open("Ethereum/data/urls/url4.txt","w")

urlf1.write(url1)
urlf2.write(url2)
urlf3.write(url3)
urlf4.write(url4)

urlf1.close()
urlf2.close()
urlf3.close()
urlf4.close()



