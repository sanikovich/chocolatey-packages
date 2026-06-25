$ErrorActionPreference = 'Stop'

$packageName = 'anycubic-slicer-next'
$url = 'https://cdn.anycubic-cloud.anycubic.com/file/2026/06/04/exe/178056438667556400/1.4.1.2_20260604104326_AnycubicSlicerNext.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  checksum      = '135AB8D7D1964644F7A65E4C65915D58BE639845A50A61A0B87470970A9FE872'
  checksumType  = 'sha256'
  silentArgs    = '/S /silent /verysilent /suppressmsgboxes /norestart'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs