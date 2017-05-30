# Beta Testing

1. Install Chocolatey, if you have not already:

https://chocolatey.org

2. Clone this repository:

`git clone https://github.com/tidalcycles/tidal-chocolatey tidal-chocolatey`

3. Build the TidalCycles Chocolatey package:

`cd tidal-chocolate\tidal`
`cpack`

4. Install the package:

`choco install tidalcycles -s "'.;https://chocolatey.org/api/v2/'"`

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

5. Start SuperCollider

6. From the SuperCollider app, find the "Recompile Class Library" menu option and run it.

7. From the SuperCollider editor, boot up SuperDirt like you normally would. Something like this:

`SuperDirt.start`

Feel free to execute an alternate boot process or load other sample paths.

8. Start Atom *using a Haskell Stack context*. From a command prompt:

`stack exec atom`

9. Create a .tidal file in Atom and write Tidal code as you normally would. 

