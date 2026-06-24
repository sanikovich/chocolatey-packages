$ErrorActionPreference = 'Stop'
$packageName = 'zed-core'
$softwareName = 'Zed'

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
    $uninstallString = $key[0].UninstallString
    $uninstallArgs = @{
        packageName    = $packageName
        fileType       = 'exe'
        silentArgs     = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART'
        validExitCodes = @(0)
        file           = $uninstallString.Trim('"')
    }
    Uninstall-ChocolateyPackage @uninstallArgs
} elseif ($key.Count -eq 0) {
    Write-Warning "$packageName has already been uninstalled by other means."
} else {
    Write-Warning "$($key.Count) matches found! To prevent accidental data loss, no programs will be uninstalled."
}