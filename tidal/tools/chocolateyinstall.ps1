$packageName= 'tidalcycles'

$pulsarPath = Get-AppInstallLocation Pulsar
$apmPath = Join-Path $pulsarPath "Resources\app\ppm\bin"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + $apmPath + ";" + $pulsarPath

### install Tidal
Write-Host "Installing tidal library. This may take time." 
cabal update
cabal v1-install tidal

## Install the TidalCycles package using apm
cd $apmpath
Write-Host "Installing TidalCycles package"
Write-Host "path: " $pulsarPath
.\apm.cmd install tidalcycles

Write-Host "If there were problems with the Pulsar plugin install, you may need to manually install."
Write-Host "See: http://tidalcycles.org/docs/getting-started/editor/Pulsar `n"
Write-Host "Get started Tidaling:"
Write-Host 'd1 $ sound "bd [hh hh] sn cr" '
