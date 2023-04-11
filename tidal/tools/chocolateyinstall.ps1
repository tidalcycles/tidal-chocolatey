$packageName= 'tidalcycles'

$scPath = Get-AppInstallLocation SuperCollider
$pulsarPath = Get-AppInstallLocation Pulsar
$apmPath = Join-Path $pulsarPath "Resources\app\ppm\bin"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + $scPath + ";" + $apmPath + ";" + $pulsarPath

### install SuperDirt
Write-Host "Supercollider path: " $scPath
$ChocolateyPackagePath = Get-ChocolateyPath -PathType 'PackagePath'
$quarkinstall_path = $ChocolateyPackagePath + '\tools\quarkinstall.sc'
Write-Host 'Installing SuperDirt sound synth and sample library. This may take time.'
cd $scpath
.\sclang $quarkinstall_path

### install Tidal
Write-Host "Installing tidal library. This may take time." 
cabal update
cabal v1-install tidal

## Install the TidalCycles package using apm
cd $apmpath
Write-Host "Installing TidalCycles package"
Write-Host "path: " $pulsarPath
.\apm.cmd install tidalcycles

Write-Host "If SuperDirt or other Quarks didn't install properly, you can install them in the SuperCollider IDE."
Write-Host "See User Docs install page for details.`n"

Write-Host "If there were problems with the plugin install, you may need to manually install."
Write-Host "See: http://tidalcycles.org/docs/getting-started/editor/Pulsar `n"
Write-Host "Get started Tidaling:"
Write-Host 'd1 $ sound "bd [hh hh] sn cr" '
