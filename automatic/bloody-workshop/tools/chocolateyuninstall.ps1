$ErrorActionPreference = 'Stop'

$packageName = 'bloody-workshop'
$softwareName = 'Bloody WorkShop*'

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
    $uninstallString = $key[0].UninstallString

    $packageArgs = @{
        packageName    = $packageName
        fileType       = 'exe'
        silentArgs     = '/S /VERYSILENT /SUPPRESSMSGBOXES'
        validExitCodes = @(0, 3010, 1641)
        file           = $uninstallString.Trim('"')
    }

    Uninstall-ChocolateyPackage @packageArgs
}
elseif ($key.Count -eq 0) {
    Write-Warning "$packageName has already been uninstalled by other means."
}
else {
    Write-Warning "$($key.Count) matches found! No programs will be uninstalled."
}