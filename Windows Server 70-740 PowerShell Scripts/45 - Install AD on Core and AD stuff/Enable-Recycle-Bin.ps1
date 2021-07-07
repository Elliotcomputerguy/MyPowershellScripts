Import-module ActiveDirectory

Enable-ADOptionalFeature 'Recycle Bin Feature' -Scope ForestOrConfigurationSet -Target <your forest root domain name>
Get-ADOptionalFeature -filter *