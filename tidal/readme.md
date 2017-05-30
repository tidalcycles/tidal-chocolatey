# Beta Testing

If you'd like to test the TidalCycles package install on Windows, follow these instructions:

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

### 6. From the SuperCollider app, find the "Recompile Class Library" menu option and run it.

### 7. From the SuperCollider editor, boot up SuperDirt like you normally would. Something like this:

```bash
SuperDirt.start
```

Feel free to execute an alternate boot process or load other sample paths.

### 8. Start Atom *using a Haskell Stack context*. From a command prompt:

```bash
stack exec atom
```

You *must* start Atom in this way. If you fail to use `stack exec` to start Atom, then the TidalCycles package inside Atom will not work.


### 9. Create a .tidal file in Atom and write Tidal code as you normally would. 

