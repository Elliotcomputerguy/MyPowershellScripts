#install the Active Directory role using the following:
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

#View available modules for AD DS
Get-Command -Module ADDSDeployment

#Install root domain
Install-ADDSForest -DomainName “Azurelabs.com”

#The server will restart. Once server is available again check to make sure changes were made. 
Get-ADDomain
