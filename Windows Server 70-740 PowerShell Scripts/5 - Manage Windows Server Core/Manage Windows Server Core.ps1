#setup server core

#scconfig for iteractive menu

#add ip 
get-netadapter
new-netipaddress -interfaceIndex 2 -IPaddress 192.168.101 -prefixlength 24 -defaultgateway 192.168.1.1

#set dns
set-dnsclientserveraddress -interfaceAlias "ethernet" -serveraddresses ("192.168.1.100","8.8.8.8.8")

#get-netipconfig
get-netipconfiguration

#get-filewall status
get-netfirewallprofile

#set firewall
set-netfirewallprofile -profile domain,public,private -Enabled True
set-netfirewallprofile -profile domain,public,private -Enabled False

#rename computer
rename-computer -NewName corenug -restart

#get enviroment variables
$env:COMPUTERNAME

#join domain
add-computer -domainname domainname.com

#restart-computer
restart-computer

# Disable IPV6
Get-NetAdapterBinding
Disable-NetAdapterBinding –InterfaceAlias “Ethernet0” –ComponentID ms_tcpip6

# add ip address
Get-NetAdapter -Name *
New-NetIPAddress -InterfaceIndex 12 -IPAddress 192.168.0.1 -prefixLength 24 -Gateway 192.168.0.254 
Set-NetIPAddress -InterfaceIndex 12 -IPAddress 192.168.0.1 -PrefixLength 24

# enter a powershell session on a remote machine
Enter-PSSession -ComputerName CORE-NUG

# view all available features
Get-WindowsFeature

# install web server (iis) role and management service
Install-WindowsFeature -Name Web-Server, Web-Mgmt-Service

# view installed features
Get-WindowsFeature | Where-Object Installed -eq True

# configure remote management for IIS
Set-ItemProperty -Path "HKLM:\Software\Microsoft\WebManagement\Server" -Name "EnableRemoteManagement" -Value 1

# configure remote managent service to start automatically
Set-Service WMSVC -StartupType Automatic

# rename a computer
Rename-Computer -NewName WEB-NUG -DomainCredential "nuggetlab\administrator" -Force -Restart

# exit remote powershell session
Exit-PSSession

# send a command over to a remote machine (powershell remoting - http)
Invoke-Command -ComputerName WEB-NUG -ScriptBlock { Get-Service W3SVC, WMSVC }

# use the built in computername parameter (windows - dcom)
Get-Service -ComputerName WEB-NUG

# When managing from a win 10 machine you need to add the below into the client win 10 machine

winrm quickconfig
winrm set winrm/config/client '@{TrustedHosts="Computer1,Computer2"}'