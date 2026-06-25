$ErrorActionPreference = 'Stop'

$packageName = 'anycubic-photon-workshop'
$url = 'https://cdn.anycubic-cloud.anycubic.com/file/2026/06/12/exe/178125351948094600/AnycubicPhotonWorkshop_v4.1.7_x64.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  checksum      = 'DB506C49DB40BE50D9F270C032D1F2F03DDCA28366457DA4FD5C80980E5B8EEC'
  checksumType  = 'sha256'
  silentArgs    = '/S /silent /verysilent /suppressmsgboxes /norestart'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs