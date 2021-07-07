#offline domain join

#on dc run the below
djoin /provision /domain <domain> /machine <machine-name> /savefile c:\c1
#logon to new computer
copy the file from the dc to local computer and run the below
djoin /requestodf /loadfile c:\c1 /windowspath %systemroot%/localos


