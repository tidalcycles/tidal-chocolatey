$packageName= 'tidalcycles'

# refresh env vars after other packages have been installed

$scpath = Join-Path $env:programfiles "SuperCollider-3.9.3"
$codepath = Join-Path $env:programfiles "Microsoft VS Code"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + $scpath + ";" + $codepath

### install tidalcycles Code package
Write-Host 'Installing the TidalCycles VS Code extension'
code --install-extension tidalcycles.vscode-tidalcycles

#get-childitem $env:localappdata
#get-childitem $apmpath

### install SuperDirt
$quarkinstall_path = $env:ChocolateyPackageFolder + '\tools\quarkinstall.sc'
Write-Host 'Installing SuperDirt sound synth and sample library. This will probably take a long time.'
sclang $quarkinstall_path

# Finally, install Tidal
Write-Host "Installing Tidal library. This will also take a long time." 
cabal v1-update
cabal v1-install tidal

Write-Host 'Done.'
Write-Host 'd1 $ sound "bd sn"'
