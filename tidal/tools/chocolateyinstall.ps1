$packageName= 'tidalcycles'

$scPath = Get-AppInstallLocation SuperCollider
$pulsarPath = Get-AppInstallLocation Pulsar
$apmPath = Join-Path $pulsarPath "Resources\app\ppm\bin"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + $scPath + ";" + $apmPath + ";" + $pulsarPath

### install Tidal
Write-Host "1/3 Installing tidal library. This may take time." 
cabal update
cabal v1-install tidal

## Install the TidalCycles package using apm
cd $apmpath
Write-Host "2/3 Installing TidalCycles package"
Write-Host "path: " $pulsarPath
.\apm.cmd install tidalcycles

### install SuperDirt
Write-Host '3/3 Installing SuperDirt sound synth and sample library. This will take some time.'
Write-Host "NOTE: this process may hang after a successful install, it is safe to ctrl+c if this happens"
$ChocolateyPackagePath = Get-ChocolateyPath -PathType 'PackagePath'
$quarkinstall_path = $ChocolateyPackagePath + '\tools\quarkinstall.sc'
cd $scpath
.\sclang $quarkinstall_path

Write-Host "Get started Tidaling:"
Write-Host 'd1 $ sound "bd [hh hh] sn cr" '
