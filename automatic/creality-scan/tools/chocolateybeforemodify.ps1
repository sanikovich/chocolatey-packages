$packageName = 'creality-scan'
$processName = 'CrealityScan'

Write-Host "Stopping $packageName processes before modification..."

Get-Process | Where-Object { 
    $_.ProcessName -like "*$processName*" -or 
    $_.MainWindowTitle -like "*Creality Scan*" 
} | Stop-Process -Force -ErrorAction SilentlyContinue

Start-Sleep -Seconds 2