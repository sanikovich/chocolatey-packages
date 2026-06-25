$ErrorActionPreference = 'Stop'

$packageName = 'elegoo-slicer'
$url = 'https://github.com/ELEGOO-3D/ElegooSlicer/releases/download/v1.5.2.2/ElegooSlicer_Windows_Installer_V1.5.2.2.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  checksum      = ''                    # Заполни после подсчёта
  checksumType  = 'sha256'
  silentArgs    = '/S /silent /verysilent /suppressmsgboxes /norestart'
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs