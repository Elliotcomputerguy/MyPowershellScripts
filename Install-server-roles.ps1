
#locate what server features have been installed
Get-WindowsFeature

#Install a single server feature
Install-WindowsFeature -Name [feature_name] -[Options] 

#Example
Install-WindowsFeature DNS -IncludeManagementTools

#Find a windows feature
Get-WindowsFeature | where {($_.name -like “DNS”)}