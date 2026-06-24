import-module au

$releases = 'https://api.github.com/repos/zed-industries/zed/releases/latest'

function global:au_SearchReplace() {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
        ".\zed-core.nuspec" = @{
            "(\<version\>).*?(\<\/version\>)" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

function global:au_GetLatest() {
    $latestRelease = Invoke-RestMethod -Uri $releases
    
    $version = $latestRelease.tag_name.TrimStart('v')
    $asset   = $latestRelease.assets | Where-Object { $_.name -like "Zed-x86_64.exe" } | Select-Object -First 1

    if (!$asset) {
        throw "Asset Zed-x86_64.exe not found in latest release"
    }

    @{
        Version    = $version
        URL64      = $asset.browser_download_url
        Checksum64 = Get-RemoteChecksum $asset.browser_download_url -Algorithm 'sha256'
    }
}

update -ChecksumFor 64