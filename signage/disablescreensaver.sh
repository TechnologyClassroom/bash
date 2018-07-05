# disablescreensaver.sh
# Michael McMahon
# Disables screensaver on Raspbian OS for Raspberry Pi

xset s off
xset -dpms
xset s noblank
gsettings set org.gnome.desktop.screensaver idle-activation-enabled false
setterm -blank 0 -powerdown 0  -powersave off
