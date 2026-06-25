import-module au

function global:au_SearchReplace() {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }
        "elegoo-slicer.nuspec" = @{
            "(\<version\>).*?(\<\/version\>)" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

function global:au_GetLatest() {
    $latest = Invoke-RestMethod -Uri "https://api.github.com/repos/ELEGOO-3D/ElegooSlicer/releases/latest"
    
    $version = $latest.tag_name.TrimStart('v')
    $asset   = $latest.assets | Where-Object { $_.name -like "*ElegooSlicer_Windows_Installer*" } | Select-Object -First 1

    if (-not $asset) {
        throw "Installer not found in latest release"
    }

    @{
        Version   = $version
        URL       = $asset.browser_download_url
        Checksum  = Get-RemoteChecksum $asset.browser_download_url -Algorithm 'sha256'
    }
}

update -ChecksumFor 64 -NoReadme