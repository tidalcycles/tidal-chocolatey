$packageName= 'tidalcycles'

# refresh env vars after other packages have been installed
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

# todo
# - Atom tidalcycles package apm install
# - install superdirt quark
# - stack setup
# - stack install tidal
# - default dirt samples ?

# install tidalcycles Atom package
Write-Host 'Installing TidalCycles Atom package.'
apm install tidalcycles

# install SuperDirt quark
$superDirtUrl = 'https://github.com/musikinformatik/SuperDirt'
$quarksPath = $env:LOCALAPPDATA + '\SuperCollider\downloaded-quarks'

if (!(Test-Path -Path $quarksPath)){
    Write-Host "Creating " $quarksPath
    New-Item -ItemType directory -Path $quarksPath
}

$superDirtPath = $quarksPath + '\SuperDirt'

Write-Host 'Installing SuperDirt quark.'
git clone $superDirtUrl $superDirtPath

