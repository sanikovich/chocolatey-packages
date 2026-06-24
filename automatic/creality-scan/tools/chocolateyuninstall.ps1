$ErrorActionPreference = 'Stop'

$packageName = 'creality-scan'
$softwareName = 'Creality Scan*'

[array]$key = Get-UninstallRegistryKey -SoftwareName $softwareName

if ($key.Count -eq 1) {
    $uninstallString = $key[0].UninstallString

    $packageArgs = @{
        packageName    = $packageName
        fileType       = 'exe'
        silentArgs     = '/S'                    # Silent uninstall
        validExitCodes = @(0)
        file           = $uninstallString.Trim('"')
    }

    Uninstall-ChocolateyPackage @packageArgs
}
elseif ($key.Count -eq 0) {
    Write-Warning "$packageName has already been uninstalled by other means."
}
else {
    Write-Warning "$($key.Count) matches found!"
    Write-Warning "To prevent accidental data loss, no programs will be uninstalled."
    Write-Warning "Please alert the package maintainer the following keys were matched:"
    $key | ForEach-Object { Write-Warning "- $($_.DisplayName)" }
}