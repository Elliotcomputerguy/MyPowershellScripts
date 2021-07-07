#flexible Single Master Operator roles
# only the PDC and Infrastructure must always be online.
#move the schemma master = Scope Forest Wide
#to manage schemma you need to insall the dll
regsvr32 schmmgmt.dll
mmc add schemma
#change active directory domain controller

#Domain Naming Master = Scope Forest
#lives in domains and trusts. to migrate go to another domain 
#controller and then you can sieze the domain name master

PDC Emulator = scope domain wide - must stay online
RID Master = scope domain wide - cant create accounts while offline
Infrastructure master = domain wide - must stay online
lives in users and computers, select domain and select 
operations master to migrate roles

#List fsmo roles

netdom /query fsmo

Get-ADForest yourdomain | Format-Table SchemaMaster,DomainNamingMaster
Get-ADDomain yourdomain | format-table PDCEmulator,RIDMaster,InfrastructureMaster