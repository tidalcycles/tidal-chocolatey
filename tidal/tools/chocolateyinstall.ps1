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
