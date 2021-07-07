# install rat powershell feature on win 10
Install-WindowsFeature RSAT-AD-PowerShell
# verify install
Get-WindowsFeature -Name RSAT-AD-PowerShell
#locate all dc's
(Get-ADForest).Domains | %{ Get-ADDomainController -Filter * -Server $_ }| Format-Table -Property Name,ComputerObjectDN,Domain,Forest,IPv4Address,OperatingSystem,OperatingSystemVersion