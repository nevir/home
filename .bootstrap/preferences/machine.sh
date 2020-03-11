sudo scutil --set ComputerName "$USERNAME"
sudo scutil --set HostName "$USERNAME"
sudo scutil --set LocalHostName "$USERNAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$USERNAME"
