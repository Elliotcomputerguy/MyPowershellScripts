#
# Windows Powershell script for AD DS Deployment Core
#


Import-Module ADDSDeployment
Install-ADDSForest `
-CreateDnsDelegation:$false `
-DatabasePath "C:\Windows\NTDS" `
-DomainMode "WinThreshold" `
-DomainName "yourdomain.com" `
-DomainNetbiosName "NetbiosName" `
-ForestMode "WinThreshold" `
-InstallDns:$true
-LogPath "C:\Windows\NTDS" `
-NoRebootOnCompletion:$false `
-SysvolPath "C:\Windows\SYSVOL" `
-Force:$true
