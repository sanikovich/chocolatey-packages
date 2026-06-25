$ErrorActionPreference = 'Stop'

$packageName = 'elegoo-satellite'
$url = 'https://iot-p.elegoo.com/devs/ota/a67bd7cb-cd41-47df-9375-51983c9fcb0e_1780298070409/ELEGOO_SatelLite_1.0.2.22.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  checksum      = '6446E840B61B6651C5DFD9086C3793331AB6C9CEDB1BB88FE0BB4329240D10A2'
  checksumType  = 'sha256'
  silentArgs    = '/S /silent /verysilent /suppressmsgboxes /norestart'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs