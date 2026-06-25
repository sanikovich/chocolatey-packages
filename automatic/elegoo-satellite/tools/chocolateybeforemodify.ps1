$packageName = 'elegoo-satellite'
$softwareName = 'ELEGOO SatelLite*'

Write-Host "Stopping $softwareName processes before upgrade..."

Get-Process | Where-Object { $_.ProcessName -like "SatelLite*" -or $_.MainWindowTitle -like "*SatelLite*" } | 
  Stop-Process -Force -ErrorAction SilentlyContinue

Start-Sleep -Seconds 2