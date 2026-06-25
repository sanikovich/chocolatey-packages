$packageName = 'bloody-workshop'

Write-Host "Stopping $packageName processes before modification..."

Get-Process | Where-Object { 
    $_.ProcessName -like "*Bloody*" -or 
    $_.MainWindowTitle -like "*Bloody*" 
} | Stop-Process -Force -ErrorAction SilentlyContinue

Start-Sleep -Seconds 2