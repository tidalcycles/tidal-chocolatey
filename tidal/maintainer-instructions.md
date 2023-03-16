Instructions and explanation for how to make updates to the TidalCycles Chocolatey Package.  
*Pre-requisite:* You must be a "maintainer" of the TidalCycles package in Chocolatey. 
  - register for a Chocolatey account
  - any of the existing maintainers can add you as maintainer

## Overview
Maintenance of the Chocolatey TidalCycles package includes any changes needed to the current package version and adding new versions.
It also includes coordinating any work needed to update the package dependencies. Making changes to a package includes updating the files in this repo as needed, clone the repo to your Windows env, run the `choco` commands to create a package, test/validate the package, and push it up to the chocolatey environment. Typically, the choco commands are run from a local Windows environment - a VM is helpful as validation may need to be run multiple times. It may be possible to do this from Linux or MacOS - see the user docs. 

Documentation: https://docs.chocolatey.org/en-us/create/
- see the Quick Guide, but note that some important command line details and options are not covered

## Details - files to edit
1. tidal.nuspec
This is a required configuration file. To update, change the version # and any other details. 
  - version: The dependency list includes version numbers. The version has to be a version that is available in Chocolatey, which may not be the latest. For example: SuperCollider 3.12.1 is listed even though it is several years old, because it is what is available as a package in choco. 
  - see [Microsoft NuGet Package Version](https://learn.microsoft.com/en-us/nuget/concepts/package-versioning#Specifying-Version-Ranges-in-.nuspec-Files) specification. Note the detail on Version Range syntax. 

2. tools/chocolateyinstall.ps1
This powershell script is run **after** all of the dependencies packages are installed - choco will manage each of them with powershell commands. The main purpose of this script is to do any final install or configuration tasks that are not accomplished by the dependency package. Tasks in this script:
  - run the tools/quarkinstall.sc file from `sclang` to install SuperDirt, Dirt-Samples, and Vowel quark
  - install Tidal with`cabal` commands
  - download Pulsar installer, run the installer, and run the apm command to get the TidalCycles package for Pulsar
  - manage additional environment variables needed for the install and post install
  - Provide instructions back to the user (note these may not get to the user if there is a script failure, depending on where it fails)

3. tools/quarkinstall.sc
Contains the commands run by SuperCollider (sclang) to install SuperDirt and quarks.

## Details - Package creation
Quick Start Guide: https://docs.chocolatey.org/en-us/create/create-packages-quick-start

Below are the steps needed to create a new version of the Tidalcycles chocolatey package:
From Windows Powershell (with choco and git installed):
1. create a choco build dir (name it whatever); cd to it
2. Clone this repo
3. In Powershell, `cd` to the tidal directory where `tidal.nuspec` is located.
4. create a choco package file (.nupkg):

```powershell
choco pack
```

Successful package creation will yield a "success" message and a package file: `TidalCycles.<version>.nupkg`

4. Test package
  - The best way to validate is with a full package install - this requires a fresh environment as all dependencies will be installed. 
  - It is also possible to test just the PS functions by editing the tidal.nuspec and commenting or removing the major dependencies. 
  - Note: Once you have installed a package via choco, choco will detect this and skip it the next time. 
  - Expand the source option: since there are dependency packages not local, an expanded list of the 'source' option is needed. This is NOT in the Quick Guide but is covered in the Package Creation under "Commands." 

```powershell
choco install TidalCycles.1.9.3.nupkg --source "'.;https://community.chocolatey.org/api/v2'"
```

5. Push to Chocolatey
  - API key - available on your Account page (only required the first time you push)
  - Push

```powershell
choco apikey --api-key [YOUR API_KEY_HERE] -source https://push.chocolatey.org/
choco push <TidalCycles>.nupkg --source https://push.chocolatey.org/
```

6. Resolve any Validation issues    
  - Chocolatey will generate email messages with status. If there are any validation automation errors, you need to resolve them and re-submit (`choco pack` and `choco push`). 
  - Validation is not immediate - it appears to be a batch process.
  - Follow all directions carefully - the emails are dense and it is tempting to skip over important details. 
  - Getting an admin to intervene or provide help ... "No human moderators see packages until automated checks are passed or the maintainer uses the review comments box to respond."
  - New releases in choco require human admin approval after all the validation steps are complete. These can take several days, depending...

