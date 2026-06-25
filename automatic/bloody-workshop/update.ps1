import-module au

function global:au_SearchReplace() {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }
        "bloody-workshop.nuspec" = @{
            "(\<version\>).*?(\<\/version\>)" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

function global:au_GetLatest() {
    $version = '2026.0615'
    $url     = 'https://www.a4tech.com.tw/download/BloodyMouse/BloodyWorkShop8_V2026.0615.exe'

    @{
        Version   = $version
        URL       = $url
        Checksum  = Get-RemoteChecksum $url -Algorithm 'sha256'
    }
}

update -ChecksumFor 64 -NoReadme