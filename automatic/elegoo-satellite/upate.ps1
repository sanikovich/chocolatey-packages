import-module au

function global:au_SearchReplace() {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }
        "elegoo-satellite.nuspec" = @{
            "(\<version\>).*?(\<\/version\>)" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

function global:au_GetLatest() {
    # На данный момент ссылка прямая, автообновление пока ограничено
    $version = '1.0.2.22'
    $url     = 'https://iot-p.elegoo.com/devs/ota/a67bd7cb-cd41-47df-9375-51983c9fcb0e_1780298070409/ELEGOO_SatelLite_1.0.2.22.exe'

    @{
        Version   = $version
        URL       = $url
        Checksum  = Get-RemoteChecksum $url -Algorithm 'sha256'
    }
}

update -ChecksumFor 64 -NoReadme