#locate role something
get-windowsfeature *role or feature*
#install role
install-windowsfeature -name -IncludeManagementTools


powershell basics:

get-command -module netadapter or 
get-command -noun net*
get-command -verb
get-command *computer* = gets all the commands for comupter
get-help rename-computer -Full
update-Help (dont run on prod) 