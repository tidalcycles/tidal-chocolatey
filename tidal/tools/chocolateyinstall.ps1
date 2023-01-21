$packageName= 'tidalcycles'

# write new paths for SuperCollider, Pulsar and Pulsar apm 
#   then load machine and user path values 

$scPath = Join-Path $env:programfiles "SuperCollider-3.12.1"
$apmPath = Join-Path $env:localappdata "Programs\Pulsar\Resources\app\ppm\bin"
$pulsarPath = "$env:localappdata\Programs\Pulsar"
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + $scPath + ";" + $apmPath + ";" + $pulsarPath

### install SuperDirt
$quarkinstall_path = $env:ChocolateyPackageFolder + '\tools\quarkinstall.sc'
Write-Host 'Installing SuperDirt sound synth and sample library. This may take time.'
cd $scpath
.\sclang $quarkinstall_path

### install Tidal
Write-Host "Installing tidal library. This may take time." 
cabal update
cabal v1-install tidal

### install pulsar via download
# NOTE: can be removed once pulsar is available in chocolatey
$wc = New-Object System.Net.WebClient
$pulsarUrl = "https://download.pulsar-edit.dev/?os=windows&type=windows_setup"
$downloadPath = Join-Path $env:HOMEPATH "Downloads\pulsarInstall.exe"
Write-Host "Downloading Pulsar to $downloadPath"
$wc.DownloadFile($pulsarUrl, $downloadPath)

Write-Host "Installing Pulsar - this may take awhile"
Start-Process -FilePath $downloadPath
cd $apmpath
Write-Host "Installing Tidalcycles package to Pulsar"
.\apm.cmd install tidalcycles
Write-Host "Pulsar Install completed"

Write-Host "Done with TidalCyles package Install."
Write-Host "Review the Chocolatey log file for details on errors: C:\ProgramData\chocolatey\logs\chocolatey.log"
Write-Host "If SuperDirt or other Quarks didn't install properly, you can easily install them in the SuperCollider IDE."
Write-Host "See User Docs install page for details."

Write-Host "If there were problems with the Pulsar or Pulsar plugin install, you may need to manually install."
Write-Host "Please see: http://tidalcycles.org/docs/getting-started/editor/Pulsar"
Write-Host "Get started tidaling:"
Write-Host 'd1 $ sound "bd [hh hh] sn cr"'
