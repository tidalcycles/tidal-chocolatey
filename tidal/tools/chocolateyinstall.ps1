$packageName= 'tidalcycles'

# refresh env vars after other packages have been installed

$scpath = Join-Path $env:programfiles "SuperCollider-3.12.1"
$apmpath = Join-Path $env:localappdata "atom\bin"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + $scpath + ";" + $apmpath

### install tidalcycles Atom package
#Write-Host 'Installing TidalCycles Atom package (using apm in $apmpath).'
#apm install tidalcycles
#get-childitem $env:localappdata
#get-childitem $apmpath

### install SuperDirt
$quarkinstall_path = $env:ChocolateyPackageFolder + '\tools\quarkinstall.sc'
Write-Host 'Installing SuperDirt sound synth and sample library. This will probably take a long time.'
sclang $quarkinstall_path

# Finally, install Tidal
Write-Host "Installing tidal library. This will also take a long time." 
cabal update
cabal v1-install tidal

Write-Host 'Done.'
Write-Host 'd1 $ sound "bd sn"'

Write-Host 'Please note that this installer has not installed an editor. For a complete Tidal system, we recommend you install pulsar.'
Write-Host 'Please see: http://tidalcycles.org/docs/getting-started/editor/Pulsar'
