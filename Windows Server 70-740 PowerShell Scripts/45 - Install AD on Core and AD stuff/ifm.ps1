#install from media for slow wan links
ntdsutil
activate instance ntds
ifm
create full c:\ifm
quit
quit
#share the ifm directory
#on the new server to install the new ADDS
#get-windowsFeature
#install-windowsfeature -name active-directory -IncludeManagementTools
#install from ifm within the config wizard