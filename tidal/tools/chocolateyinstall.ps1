$packageName= 'tidalcycles'

# refresh env vars after other packages have been installed
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

# todo
# - Atom tidalcycles package apm install
# - install superdirt quark
# - stack setup
# - stack install tidal
# - default dirt samples ?

### install tidalcycles Atom package
Write-Host 'Installing TidalCycles Atom package.'
apm install tidalcycles

### ensure Quarks path
Write-Host 'Ensuring SuperCollider Quarks path.'
$quarksPath = $env:LOCALAPPDATA + '\SuperCollider\downloaded-quarks'
if (!(Test-Path -Path $quarksPath)){
    Write-Host "Creating " $quarksPath
    New-Item -ItemType directory -Path $quarksPath
}else{
    Write-Host 'Quarks path already exists.'
}

### install SuperDirt quark
Write-Host 'Installing SuperDirt quark.'
$superDirtUrl = 'https://github.com/musikinformatik/SuperDirt'
$superDirtPath = $quarksPath + '\SuperDirt'

if (!(Test-Path -Path $superDirtPath)){
    git clone $superDirtUrl $superDirtPath
} else {
    Write-Host 'SuperDirt quark already installed.'
}

### install default dirt samples
Write-Host 'Installing Dirt samples.'
$dirtSamplesUrl = 'https://github.com/tidalcycles/dirt-samples'
$samplesPath = $quarksPath + '\Dirt-Samples'

if (!(Test-Path -Path $samplesPath)){
    git clone $dirtSamplesUrl $samplesPath
} else {
    Write-Host 'Dirt-Samples already installed.'
}

### install Vowel quark
Write-Host 'Installing Vowel quark.'
$vowelQuarkUrl = 'https://github.com/supercollider-quarks/Vowel'
$vowelPath = $quarksPath = '\Vowel'

if (!(Test-Path -Path $vowelPath)){
    git clone $vowelQuarkUrl $vowelPath
} else {
    Write-Host 'Vowel quark already installed.'
}


### setup Haskell stack
Write-Host 'stack setup'
stack setup

### install tidal
Write-Host 'stack install tidal-0.9.4'
stack install tidal

### Desktop shortcut
$shortcutFolder = [Environment]::GetFolderPath("Desktop")
$shortcutPath = $shortcutFolder + "\tidal.lnk"
Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath "stack.exe" -Arguments "exec atom"

Write-Host 'Done.'
Write-Host 'd1 $ sound "bd sn"'