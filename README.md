# Chocolatey Packages for TidalCycles
This repo hosts code for all Chocolatey package related to the TidalCycles live-coding environment.

## Installation (for TidalCycles)

Make sure you have Chocolatey installed. See https://chocolatey.org for more information.

1. Run Windows PowerShell with admin privledges, and then execute this command:

```
choco install tidalcycles
```

2. Start SuperCollider

3. In SuperCollider, from the main menu select Language > Recompile Class Library.

4. Start SuperDirt:

```
SuperDirt.start
```

5. Start Atom from a _Haskell Stack context_:

```
stack exec atom
```

6. Write Tidal code!


## Testing

Interested in testing, or installing from the latest package source code?
Follow the instructions at [tidal/testing.md](tidal/testing.md).