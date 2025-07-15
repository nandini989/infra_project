# Bulk AD User Provisioning Script
Import-Csv .\users.csv | ForEach-Object {
    New-ADUser -Name $_.Name `
               -GivenName $_.GivenName `
               -Surname $_.Surname `
               -SamAccountName $_.Username `
               -UserPrincipalName "$($_.Username)@yourdomain.com" `
               -Path "OU=Users,DC=yourdomain,DC=com" `
               -AccountPassword (ConvertTo-SecureString "P@ssword123!" -AsPlainText -Force) `
               -Enabled $true
}
