$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageName = 'zed-core'
$softwareName = 'Zed'

$url = 'https://github.com/zed-industries/zed/releases/download/v1.8.2/Zed-x86_64.exe'

$packageArgs = @{
  packageName   = $packageName
  fileType      = 'exe'
  url           = $url
  softwareName  = $softwareName
  checksum      = '147744BA96840924606345D4E7417FC53DF77A5FB809A6BECE053037378A2FD3'
  checksumType  = 'sha256'
  silentArgs    = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'  
}

Install-ChocolateyPackage @packageArgs