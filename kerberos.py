sudo apt-get install python-dev libkrb5-dev krb5-user

pip install pywinrm[kerberos]

file = open(“/etc/krb5.conf”,”w”) 
 
file.write(“[realms]”) 
file.write(“JRG.LAB = {”) 
file.write(“kdc = GB3GOCHJRGDC01.JRG.LAB”) 
file.write(“}”) 
file.write(“”)
file.write(“[domain_realm]”)
file.write(“.JRG.LAB = JRG.LAB”)
 
file.close() 
