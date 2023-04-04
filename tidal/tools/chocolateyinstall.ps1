$packageName= 'tidalcycles'

# write new paths for SuperCollider, Pulsar and Pulsar apm 
#   then load machine and user path values 

$scPath = Get-AppInstallLocation SuperCollider
$apmPath = Join-Path $env:localappdata "Programs\Pulsar\Resources\app\ppm\bin"
$pulsarPath = "$env:localappdata\Programs\Pulsar"
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

### install pulsar via download
# NOTE: can be removed once pulsar is available in chocolatey
##  $pulsarUrl from download.pulsar.dev not reliable, temporary use of pulsar github to 1.101.0-beta release
##    will need to change with new releases
##  Pulsar install done with Start-Process using -ArgumentList for silent install with no external window
##    -Wait option insures that script will wait for install process to complete

$wc = New-Object System.Net.WebClient
#$pulsarUrl = "https://github.com/pulsar-edit/pulsar/releases/download/v1.101.0-beta/Windows.Pulsar.Setup.1.101.0-beta.exe"
$pulsarUrl = "https://download.pulsar-edit.dev/?os=windows&type=windows_setup"

$downloadPath = Join-Path $env:HOMEPATH "Downloads\pulsar-1.101.0-Install.exe"
Write-Host "Downloading Pulsar to $downloadPath"
$wc.DownloadFile($pulsarUrl, $downloadPath)

Write-Host "Installing Pulsar - this may take awhile"
Start-Process -FilePath $downloadPath -Wait -ArgumentList '/S','/v','qn' -PassThru

## now install the TidalCycles package using apm
cd $apmpath
Write-Host "Installing Tidalcycles package to Pulsar"
.\apm.cmd install tidalcycles
Write-Host "Pulsar Install completed"

Write-Host "If SuperDirt or other Quarks didn't install properly, you can install them in the SuperCollider IDE."
Write-Host "See User Docs install page for details.`n"

Write-Host "If there were problems with the Pulsar or Pulsar plugin install, you may need to manually install."
Write-Host "See: http://tidalcycles.org/docs/getting-started/editor/Pulsar `n"
Write-Host "Get started tidaling:"
Write-Host 'd1 $ sound "bd [hh hh] sn cr" '
