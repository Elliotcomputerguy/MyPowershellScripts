#create service 
#instead of creating a service account via users and computers you can use a virtual account 
NT Service so msft manages it.
New-Service -Name <service_name> -BinaryPathName c:\windows\system32\notepad.exe

#managed service accounts only good for local machine
New-ADServiceAccount -Name <account-name> -RestrictToSingleComputer

Add-ADComputerServiceAccount -Identity <DC-COMPUTER-NAME> -ServiceAccount <account-name>

Test-ADServiceAccount -Identity <acount-name>

# create dummy service
New-Service -Name <service-name> -BinaryPathName c:\windows\system32\notepad.exe

change logon tab on service properties and input the managed service account name


#group managed service account for multiple systems

#create key distribution center root key -occurs imediately and tricks the system.
Add-KDSRootKey -EffectiveTime (Get-Date).AddHours((-10))

#prod wait 10 hours
Add-KDSRootKey -EffectiveImmediately

# create a group managed service account

Install-ADServiceAccount -Name <account-name> -DNSHostName <account-name.domain-name> -PrincipalsAllowedToRetrieveManagedPassword "Domain Computers"

Invoke-Command -ComputerName <comp-name,computer-name> -scriptblock { Install-WindowsFeature RSAT-AD-Powershell }

install the group manager service account on remote machines

Invoke-command -ComputerName <comp-name> -scriptblock { Install-ADServiceAccount <account-name> }Install-ADServiceAccount <account-name>
Invoke-command -ComputerName <comp-name> -scriptblock { Test-ADServiceAccount <account-name> }Install-ADServiceAccount <account-name>
Invoke-command -ComputerName <comp-name> -scriptblock { New-Service -Name <service-name> -BinaryPathName c:\windows\system32\notepad.exe }
change logon to the gropu managed service account