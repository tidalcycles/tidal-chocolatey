# Chocolatey Packages for TidalCycles
This repo hosts code for all Chocolatey package related to the TidalCycles live-coding environment.

## TidalCycles Installation (for new users)

Make sure you have Chocolatey installed. See https://chocolatey.org for more information.

1. Run Windows PowerShell with admin privileges (which you can find by holding down the windows key and pressing x), and then execute this command:

```bash
choco install tidalcycles
```

2. Review output and check logs for any errors. Some install steps may have failed or remain in complete. 

3. Start SuperCollider

4. Start SuperDirt:

```
// Within the SuperCollider IDE, type and put your cursor on this code, then Shift+Enter
SuperDirt.start
```

4. Start Pulsar (Start Button -> Pulsar)

6. Write Tidal code!

```haskell
-- type and put your cursor on this code, then Shift+Enter
d1 $ sound "bd sn"
```
