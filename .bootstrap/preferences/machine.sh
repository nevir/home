# Machine Name
if [[ "$(scutil --get ComputerName)" != "$USERNAME" ]]; then
  sudo scutil --set ComputerName "$USERNAME"
fi
if [[ "$(scutil --get HostName)" != "$USERNAME" ]]; then
  sudo scutil --set HostName "$USERNAME"
fi
if [[ "$(scutil --get LocalHostName)" != "$USERNAME" ]]; then
  sudo scutil --set LocalHostName "$USERNAME"
fi
if [[ "$(defaults read /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName)" != "$USERNAME" ]]; then
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$USERNAME"
fi

# Trackpad tap to click
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
