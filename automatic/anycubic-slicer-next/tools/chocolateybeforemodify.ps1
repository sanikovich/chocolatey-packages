$packageName = 'anycubic-slicer-next'

Write-Host "Stopping $packageName processes before modification..."

Get-Process | Where-Object { 
    $_.ProcessName -like "*AnycubicSlicer*" -or 
    $_.MainWindowTitle -like "*Anycubic Slicer*" 
} | Stop-Process -Force -ErrorAction SilentlyContinue

Start-Sleep -Seconds 2