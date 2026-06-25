$packageName = 'anycubic-photon-workshop'

Write-Host "Stopping $packageName processes before modification..."

Get-Process | Where-Object { 
    $_.ProcessName -like "*PhotonWorkshop*" -or 
    $_.MainWindowTitle -like "*Photon Workshop*" 
} | Stop-Process -Force -ErrorAction SilentlyContinue

Start-Sleep -Seconds 2