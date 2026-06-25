$packageName = 'zed-core'
$processName = 'ZedCore'

Write-Host "Stopping $packageName processes before modification..."

Get-Process | Where-Object { 
    $_.ProcessName -like "*$processName*" -or 
    $_.MainWindowTitle -like "*Zed Core*" 
} | Stop-Process -Force -ErrorAction SilentlyContinue

Start-Sleep -Seconds 2