# Pull installed hotfixes from servers
$servers = Get-Content .\servers.txt
foreach ($server in $servers) {
    Get-HotFix -ComputerName $server | 
    Select-Object PSComputerName, HotFixID, InstalledOn |
    Export-Csv ".\patch_report.csv" -Append -NoTypeInformation
}
