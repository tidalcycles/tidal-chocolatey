*Purpose:* Provide instructions and explanation for how to make updates to the TidalCycles Chocolatey Package.  
*Pre-requisite:* You must be a "maintainer" of the TidalCycles package in Chocolatey. 
  - register for a Chocolatey online account
  - any of the existing maintainers can add you as maintainer

## Overview
Maintenance of the Chocolatey TidalCycles package includes any changes needed to a current package version and adding new versions.
It also includes coordinating any work needed to update the packate dependencies. Making changes to a package includes updating the files in this repo as needed, clone the repo to your Windows env, run the `choco` commands to create a package, test/validate the package, and push it up to the chocolatey environment. Typically, the choco commands are run from a local Windows environment - a VM is really handy as validation may need to be run multiple times. It may be possible to do this from Linux or MacOS. 

Documentation: https://docs.chocolatey.org/en-us/create/
- see the Quick Guide, but note that some important command line details and options are not covered

## Details - files to edit
1. tidal.nuspec
This is a required configuration file. To update, change the version # and any other details. 
  - version: The dependency list includes version numbers. The version has to be a version that is available in Chocolatey, which may not be the latest. For example: SuperCollider 3.12.1 is listed even though it is several years old, because it is what is available as a package in choco. 

2. tools/chocolateyinstall.ps1
This powershell script is run **after** all of the dependencies packages are installed - each of which will have its own powershell commands. The main purpose of the script is to do any final install or configuration tasks that are not accomplished by the dependency package. Steps:
  - run the tools/quarkinstall.sc file from `sclang` to install SuperDirt, Dirt-Samples, and Vowel quark
  - install Tidal with`cabal` commands
  - install Pulsar and run the apm command to get the TidalCycles package for Pulsar
  - manage additional environment variables needed for the install and post install
  - Provide instructions back to the user

3. tools/quarkinstall.sc
Contains the commands run by SuperCollider (sclang) to install SuperDirt and quarks.

## Details - Package creation
Quick Start Guide: https://docs.chocolatey.org/en-us/create/create-packages-quick-start
From Windows Powershell (with choco and git installed):
1. Clone this repo
2. cd to the tidal directory - where `tidal.nuspec` is located.
3. create package file

```powershell
choco pack
```

Successful package creation will yield a "success" message and a package file: `TidalCycles.<version>.nupkg

4. Test package
The only way this author knows to validate is to do a full package install.  
NOTE: since there are dependency packages, and expanded list of source options is needed. This is NOT in the Quick Guide but is covered in the Package Creation under "Commands."

```powershell
choco install TidalCycles.1.9.3.nupkg --source "'.;https://community.chocolatey.org/api/v2'"
```

5. Push to Chocolatey
  - API key - available on your Account page
  - Push

```
choco apikey --api-key [YOUR API_KEY_HERE] -source https://push.chocolatey.org/
choco push <TidalCycles>.nupkg --source https://push.chocolatey.org/
