$shortcutFolder = [Environment]::GetFolderPath("Desktop")
$shortcutPath = $shortcutFolder + "\tidal.lnk"

remove-item $shortcutPath