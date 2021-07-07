#Directory Service Restore Mode DRSM 
#take ad offline 2003-8
bcdedit /set safeboot dsrepair
shutdown /f /r /t 00

#logon locally
bcdedit /deletevalue safeboot
shutdown /f /r /t 00


#2012R2
You can go to services and stop active directory services

#Carry out defragmentation of ad database
ntdsutil
activate instance ntds
files
compact to c:\
integrity
quit
quit
copy c:\ntds.dit c:\windows\ntds\ntds.dit
del c:\windows\ntds\*.log