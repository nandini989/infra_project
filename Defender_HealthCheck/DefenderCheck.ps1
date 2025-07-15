# Defender Health Check Script
$computers = Get-Content .\servers.txt
foreach ($comp in $computers) {
    $status = Invoke-Command -ComputerName $comp -ScriptBlock {
        Get-MpComputerStatus | Select-Object AMServiceEnabled, AntivirusEnabled, RealTimeProtectionEnabled, QuickScanStartTime
    }
    $status | Add-Member -NotePropertyName Computer -NotePropertyValue $comp
    $status | Export-Csv ".\defender_status.csv" -Append -NoTypeInformation
}
