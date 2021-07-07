#get ip addresses
Get-NetIPAddress

#get ip net configuration
get-netipconfiguration

#check ip address of interface
Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias 'Ethernet2'

#Add IP address
New-NetIPAddress –InterfaceAlias 'Ethernet2' –IPAddress '192.168.86.92' –PrefixLength 24 -DefaultGateway '192.168.86.1'

#locate ethernet state and if up add ip address and dns server and restart interface
$Eth0 = Get-NetAdapter -Name "Ethernet0" | Select status, ifIndex
if ($Eth0.status -eq "Up") {New-NetIPAddress -InterfaceAlias 'Ethernet0' -IPAddress '10.0.0.10' -PrefixLength 24 -DefaultGateway '10.0.0.1'}
Set-DnsClientServerAddress -InterfaceIndex $Eth0.ifIndex -ServerAddresses ("10.0.0.10","8.8.8.8")
Restart-NetAdapter -Name "Ethernet0"