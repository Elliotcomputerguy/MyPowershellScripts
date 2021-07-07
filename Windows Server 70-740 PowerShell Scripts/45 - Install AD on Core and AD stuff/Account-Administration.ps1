Get-command *aduser*
Get-command *adcomputer*

# unlock account
Unlock-ADAccount -Identity <user>

# Disable account
Disable-ADAccount -Identity <user>

# Enable account
Enable-ADAccount -Identity <user>

# Reset account
Set-ADAccountPassword -Identity <user> -Reset -NewPassword (ConvertTo-String -AsPlainText "password123" -Force) 

# search accounts
Search-ADAccount -UserOnly -AccountDisabled -TimeSpan 60
Search-ADAccount -UserOnly -AccountInactive -TimeSpan 60
Search-ADAccount -UserOnly -AccountExpired -TimeSpan 60

