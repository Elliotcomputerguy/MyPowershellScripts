#take a snapshot of ad and mount

ntdsutil
activate instance ntds
snapshot
create
list all
mount 2
quit
quit
dsamain -dbpath <snapshot_path>\windows\ntds\ntds.dit -ldapport 50000
goto dsa and right click ad users and computers and change to the other ad instance
computer-name:50000

# unmount active directory instance
ntdsutil activate ntds
snapshot 
list all unmount 2


 