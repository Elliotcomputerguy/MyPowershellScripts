function Get-DCsInForest {
[CmdletBinding()]
param(
    [string]$ReferenceDomain = $env:USERDOMAIN
)
 
$ForestObj = Get-ADForest -Server $ReferenceDomain
foreach($Domain in $ForestObj.Domains) {
    Get-ADDomainController -Filter * -Server $Domain | select Domain,HostName,Site
     
}
 
}

#Examples:
#Query all Domain Controllers in current forest.
#Get-DCsInForest
#Query all Domain Controllers in other forest.
#Get-DCsInForest -ReferenceDomain techibee.local