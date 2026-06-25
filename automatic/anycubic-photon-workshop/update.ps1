import-module au

function global:au_SearchReplace() {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }
        "anycubic-photon-workshop.nuspec" = @{
            "(\<version\>).*?(\<\/version\>)" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

function global:au_GetLatest() {
    $version = '4.1.7'
    $url     = 'https://cdn.anycubic-cloud.anycubic.com/file/2026/06/12/exe/178125351948094600/AnycubicPhotonWorkshop_v4.1.7_x64.exe'

    @{
        Version   = $version
        URL       = $url
        Checksum  = Get-RemoteChecksum $url -Algorithm 'sha256'
    }
}

update -ChecksumFor 64 -NoReadme