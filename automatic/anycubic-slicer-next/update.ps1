import-module au

function global:au_SearchReplace() {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }
        "anycubic-slicer-next.nuspec" = @{
            "(\<version\>).*?(\<\/version\>)" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

function global:au_GetLatest() {
    $version = '1.4.1.2'
    $url     = 'https://cdn.anycubic-cloud.anycubic.com/file/2026/06/04/exe/178056438667556400/1.4.1.2_20260604104326_AnycubicSlicerNext.exe'

    @{
        Version   = $version
        URL       = $url
        Checksum  = Get-RemoteChecksum $url -Algorithm 'sha256'
    }
}

update -ChecksumFor 64 -NoReadme