
#set dns 
$Eth0 = Get-NetAdapter -Name "Ethernet0" | Select status, ifIndex
Set-DnsClientServerAddress -InterfaceIndex $Eth0.ifIndex -ServerAddresses ("10.0.0.10","8.8.8.8")