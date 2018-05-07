$packageName= 'tidalcycles'

# refresh env vars after other packages have been installed
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") 

### install tidalcycles Atom package
Write-Host 'Installing TidalCycles Atom package.'
# apm install tidalcycles

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
    Write-Host 'Dirt-Samples already installed. This will take a few minutes to download.'
}

### install Vowel quark
Write-Host 'Installing Vowel quark.'
$vowelQuarkUrl = 'https://github.com/supercollider-quarks/Vowel'
$vowelPath = $quarksPath + '\Vowel'

if (!(Test-Path -Path $vowelPath)){
    git clone $vowelQuarkUrl $vowelPath
} else {
    Write-Host 'Vowel quark already installed.'
}

# modify SuperCollider sclang config file to look for these quarks
$sclangConfigPath = $env:LOCALAPPDATA + '\SuperCollider\sclang_conf.yaml'
$newSclangConfigPath = $env:ChocolateyPackageFolder + '\tools\sclang_conf.yaml'
$newContent = Get-Content $newSclangConfigPath
$newContent = $newContent -replace "<username>", $env:UserName

Write-Host "Writing new config to sclang_conf.yaml"
Out-File -FilePath $sclangConfigPath -InputObject $newContent

# Do cabal config changes
$configPath = $env:APPDATA + '\cabal\config'
$configExists = Test-Path $configPath
$extraConfigPath = $env:ChocolateyPackageFolder  + '\tools\cabal-config.txt'

# create cabal config if it does not exist
if (!$configExists){
    Write-Host 'cabal config file does not exist.'
    Write-Host 'cabal user-config init'
    cabal user-config init
}

$newSettings = Get-Content $extraConfigPath
Write-Host 'Writing new settings to cabal config file.'
Add-Content $configPath $newSettings

# Finally, install Tidal
Write-Host "cabal install tidal"
cabal update
cabal install tidal-0.9.9

Write-Host 'Done.'
Write-Host 'd1 $ sound "bd sn"'