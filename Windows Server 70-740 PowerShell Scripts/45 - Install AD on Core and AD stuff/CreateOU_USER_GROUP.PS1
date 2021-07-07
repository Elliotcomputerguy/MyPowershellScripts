#CREATE OU
New-ADOrganizationalUnit -Name OU1 -Path "DC=<DOMAIN>,DC=COM"

#CREATE USERS IN OU
New-ADuser -Name "user1" -SamAccountName USER1 -Path "OU=<OU>,DC=<DOMAIN>,DC=COM"

#CREATE GROUP IN OU

New-ADGroup -Name "GROUP1" -SamAccountName GROUP1 -GroupCategory Security -GroupScope DomainLocal -Path "OU=<OU>,DC=<DOMAIN>,DC=COM"

#ADD USERS TO GROUP

Add-ADGroupMember GROUP1 USER1

#LIST users in groups

Get-ADGroup GROUP1

