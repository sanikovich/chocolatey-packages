$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = 'creality-scan'
$url         = 'https://file-cdn.creality.com/file/a338c0af6398b57bdac743839ffb0592/CrealityScan_win_4.2.2.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  checksum      = '47B6141DC9024E03AEFA7FF3A879E5E385DA98A749F18E48094B63589196B150'
  checksumType  = 'sha256'
  silentArgs    = '/S /silent /verysilent /suppressmsgboxes /norestart'
}

Install-ChocolateyPackage @packageArgs