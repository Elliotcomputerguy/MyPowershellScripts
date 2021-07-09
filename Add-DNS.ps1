function Show-Menu {

    Clear-Host
    Write-Host "================ Add DNS Records ================"
    
    Write-Host "1: Press '1' Add A record"
    Write-Host "2: Press '2' Add CName record."
    Write-Host "3: Press '3' Add txt record."
    Write-Host "Q: Press 'Q' to quit."
}

do {
    Show-Menu
    $choice = Read-Host "`nEnter Choice"
    
} until (($choice -eq '1') -or ($choice -eq '2') -or ($choice -eq '3') -or ($choice -eq 'Q') )

switch ($choice) {
    '1'{
        Write-Host "`nYou have selected a record"
    }
    '2'{
       Write-Host "`nYou have selected cname"
    }
    '3'{
        Write-Host "`nYou have selected txt record"
     }
     'Q'{
       Return
    }
}



#function connect-dns_server {

#    Clear-Host
#    Write-Host "================ Add DNS ================"
#    
#    Write-Host "1: Connect to DNS server."
#    Write-Host "Q: Enter 'Q' to quit "

