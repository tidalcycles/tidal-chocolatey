# How to Test This Package

If you'd like to test the TidalCycles package install on Windows, follow the instructions below.

DISCLAIMER: test at your own risk. Testing on a clean system is recommended. The effects of installing over an existing Tidal environment are not really known yet.

### 1. Install Chocolatey, if you have not already:

https://chocolatey.org

### 2. Clone this repository:

```bash
git clone https://github.com/tidalcycles/tidal-chocolatey tidal-chocolatey
```

### 3. Build the TidalCycles Chocolatey package:

```bash
cd tidal-chocolatey\tidal
cpack
```

### 4. Install the package:

```bash
choco install tidalcycles -s "'.;https://chocolatey.org/api/v2/'"
```

This will install:

- SuperCollider
- sc3plugins
- SuperDirt quark
- Dirt-Samples quark
- Vowel quark
- Atom
- Atom TidalCycles package
- Haskell Stack
- Tidal 0.9.4

### 5. Start SuperCollider

Start the SuperCollider IDE/app on Windows.

### 6. Recompile Class Library

From the SuperCollider app, find the "Recompile Class Library" menu option and run it.

### 7. Boot SuperDirt

 From the SuperCollider editor, boot up SuperDirt like you normally would. Something like this:

```bash
SuperDirt.start
```

Feel free to execute an alternate boot process or load other sample paths.

### 8. Start Atom 

You *must use a Haskell Stack context* to start Atom. From a command prompt:

```bash
stack exec atom
```

You *must* start Atom in this way. If you fail to use `stack exec` to start Atom, then the TidalCycles package inside Atom will not work.


### 9. Write Tidal code

Create a .tidal file in Atom and write Tidal code as you normally would. 
