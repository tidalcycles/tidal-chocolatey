$packageName= 'tidalcycles'

# refresh env vars after other packages have been installed
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

### install tidalcycles Atom package
Write-Host 'Installing TidalCycles Atom package.'
apm install tidalcycles

### install SuperDirt
$quarkinstall_path = $env:ChocolateyPackageFolder + '\tools\quarkinstall.sc'
Write-Host 'Installing SuperDirt sound synth and sample library. This will probably take a long time.
sclang $quarkinstall_path

# Finally, install Tidal
Write-Host "Installing tidal library. This will also take a long time." 
cabal v2-update
cabal v2-install tidal --lib

Write-Host 'Done.'
Write-Host 'd1 $ sound "bd sn"'
