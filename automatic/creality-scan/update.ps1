import-module au

function global:au_SearchReplace() {
    @{
        "tools\chocolateyInstall.ps1" = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL)'"
            "(?i)(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
        }
        "creality-scan.nuspec" = @{
            "(\<version\>).*?(\<\/version\>)" = "`${1}$($Latest.Version)`${2}"
        }
    }
}

function global:au_GetLatest() {
    $releases = 'https://www.crealitycloud.com/downloads/software/creality-scan/Windows'
    
    # На данный момент прямой парсинг страницы сложный, поэтому используем фиксированную версию
    # Можно улучшить позже
    $version = '4.2.2'
    $url     = 'https://file-cdn.creality.com/file/a338c0af6398b57bdac743839ffb0592/CrealityScan_win_4.2.2.exe'

    @{
        Version   = $version
        URL       = $url
        Checksum  = Get-RemoteChecksum $url -Algorithm 'sha256'
    }
}

update -ChecksumFor 64 -NoReadme