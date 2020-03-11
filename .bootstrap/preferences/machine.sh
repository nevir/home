# Machine Name
sudo scutil --set ComputerName "$USERNAME"
sudo scutil --set HostName "$USERNAME"
sudo scutil --set LocalHostName "$USERNAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$USERNAME"

# Trackpad tap to click
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
