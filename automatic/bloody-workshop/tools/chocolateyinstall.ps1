$ErrorActionPreference = 'Stop'

$packageName = 'bloody-workshop'
$url = 'https://www.a4tech.com.tw/download/BloodyMouse/BloodyWorkShop8_V2026.0615.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  checksum      = '3898D7413EE660E209BC9C82B8EB49E1E9CF17CA79283359DF6B813F4E7FDDDC'
  checksumType  = 'sha256'
  silentArgs    = '/S /silent /verysilent /suppressmsgboxes /norestart'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs