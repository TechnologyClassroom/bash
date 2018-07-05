#!/bin/bash

# BlueHillTV.sh
# Michael McMahon

# This acts as a digital slideshow for the entrance way.  It rotates between a
# picture slideshow and videos.

# Splash image
feh -FZY ~/BlueHillTV/WelcomeSpring2016/001WelcomeToTheBlueHillClub1080.png &

# Slideshow and movie loop
while true
do
  feh -FZYD 5 --cycle-once ~/BlueHillTV/WelcomeSpring2016/*.png
  omxplayer -I -o hdmi ~/BlueHillTV/Video/*.mov
done

# feh switches
# -F	Fullscreen
# -Z	auto-Zoom
# -Y	hide pointer
# -D	Delay NumberOfSeconds

# omxplayer switches
# -I		Info before playback
# -o hdmi	audio Output device as hdmi
