# splitrotation.sh
# Michael McMahon
# Control Monitor on Door to display current age list and rules

# This runs on a Raspberry Pi connected to a monitor attached to my door.

# Setup
# Install feh and xdotool with this command:
# sudo apt-get update && sudo apt-get install -y feh xdotool# This runs on a Raspberry Pi connected to a monitor attached to my door.

# Set Rules as the background once
feh -FZY Rules.png &

# feh switches
# -F	Fullscreen
# -Z	auto-Zoom
# -Y	hide pointer

# Infinite Loop
# Age groups will be flashed on the screen alternating between the rules.
while true; do

	# Time with day goes to variable
	hr=`date +%u%H%M`
	
	# Schedule
	
	# 1 Monday
	
	# 10800 - 10854 Precamp
	if test $hr -ge 10800 -a $hr -lt 10854
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F Precamp.png &
		sleep 5
		# press q to quit feh
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 10855 - 10919 9 yo
	if test $hr -ge 10855 -a $hr -lt 10919
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 10920 - 10939 9 yo Breakfast
	if test $hr -ge 10920 -a $hr -lt 10939
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 10940 - 10959 9 yo
	if test $hr -ge 10940 -a $hr -lt 10959
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 11000 - 11059 11 & 12 yo
	if test $hr -ge 11000 -a $hr -lt 11059
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 11and12yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 11100 - 11159 10 yo
	if test $hr -ge 11100 -a $hr -lt 11159
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 10yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 11200 - 11219 9 yo
	if test $hr -ge 11200 -a $hr -lt 11219
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	
	# 11220 - 11239 9 yo Lunch
	if test $hr -ge 11220 -a $hr -lt 11239
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoLunch.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 11240 - 11259 9 yo Swim Prep
	if test $hr -ge 11240 -a $hr -lt 11259
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoSwimPrep.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 11300 - 11359 9 yo Swim
	if test $hr -ge 11300 -a $hr -lt 11359
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoSwim.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 11400 - 11459 7 yo
	if test $hr -ge 11400 -a $hr -lt 11459
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 7yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 11500 - 11544 9 yo
	if test $hr -ge 11500 -a $hr -lt 11544
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 11545 - 11559 Dismissal Room
	if test $hr -ge 11545 -a $hr -lt 11559
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F Dismissal.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 11600 - 11759 After Camp
	if test $hr -ge 11600 -a $hr -lt 11759
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F AfterCamp.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 2 Tuesday
	
	# 20800 - 20854 Precamp
	if test $hr -ge 20800 -a $hr -lt 20854
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F Precamp.png &
		sleep 5
		# press q to quit feh
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 20855 - 20919 9 yo
	if test $hr -ge 20855 -a $hr -lt 20919
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 20920 - 20939 9 yo Breakfast
	if test $hr -ge 20920 -a $hr -lt 20939
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 20940 - 20959 9 yo
	if test $hr -ge 20940 -a $hr -lt 20959
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 21000 - 21059 9 yo Field Trip
	if test $hr -ge 21000 -a $hr -lt 21059
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 21100 - 21159 10 yo
	if test $hr -ge 21100 -a $hr -lt 21159
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 10yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 21200 - 21219 9 yo Field Trip
	if test $hr -ge 21200 -a $hr -lt 21459
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 21500 - 21544 9 yo
	if test $hr -ge 21500 -a $hr -lt 21544
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 21545 - 21559 Dismissal Room
	if test $hr -ge 21545 -a $hr -lt 21559
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F Dismissal.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 21600 - 21759 After Camp
	if test $hr -ge 21600 -a $hr -lt 21759
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F AfterCamp.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 3 Wednesday
	
	# 30800 - 30854 Precamp
	if test $hr -ge 30800 -a $hr -lt 30854
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F Precamp.png &
		sleep 5
		# press q to quit feh
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 30855 - 30919 9 yo
	if test $hr -ge 30855 -a $hr -lt 30919
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 30920 - 30939 9 yo Breakfast
	if test $hr -ge 30920 -a $hr -lt 30939
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 30940 - 30959 9 yo
	if test $hr -ge 30940 -a $hr -lt 30959
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 31000 - 31059 11 & 12 yo
	if test $hr -ge 31000 -a $hr -lt 31059
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 11and12yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 31100 - 31159 10 yo
	if test $hr -ge 31100 -a $hr -lt 31159
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 10yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 31200 - 31219 9 yo
	if test $hr -ge 31200 -a $hr -lt 31219
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	
	# 31220 - 31239 9 yo Lunch
	if test $hr -ge 31220 -a $hr -lt 31239
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoLunch.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 31240 - 31259 9 yo Swim Prep
	if test $hr -ge 31240 -a $hr -lt 31259
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoSwimPrep.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 31300 - 31359 9 yo Swim
	if test $hr -ge 31300 -a $hr -lt 31359
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoSwim.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 31400 - 31459 7 yo
	if test $hr -ge 31400 -a $hr -lt 31459
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 7yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 31500 - 31544 9 yo
	if test $hr -ge 31500 -a $hr -lt 31544
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 31545 - 31559 Dismissal Room
	if test $hr -ge 31545 -a $hr -lt 31559
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F Dismissal.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 31600 - 31759 After Camp
	if test $hr -ge 31600 -a $hr -lt 41759
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F AfterCamp.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 4 Thursday
	
	# 40800 - 40854 Precamp
	if test $hr -ge 40800 -a $hr -lt 40854
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F Precamp.png &
		sleep 5
		# press q to quit feh
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 40855 - 40919 9 yo
	if test $hr -ge 40855 -a $hr -lt 40919
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 40920 - 40939 9 yo Breakfast
	if test $hr -ge 40920 -a $hr -lt 40939
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 40940 - 40959 9 yo
	if test $hr -ge 40940 -a $hr -lt 40959
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 41000 - 41059 7 yo
	if test $hr -ge 41000 -a $hr -lt 41059
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 7yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 41100 - 41159 8 yo
	if test $hr -ge 41100 -a $hr -lt 41159
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 41200 - 41219 9 yo
	if test $hr -ge 41200 -a $hr -lt 41219
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	
	# 41220 - 41239 9 yo Lunch
	if test $hr -ge 41220 -a $hr -lt 41239
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoLunch.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 41240 - 41259 9 yo Swim Prep
	if test $hr -ge 41240 -a $hr -lt 41259
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoSwimPrep.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 41300 - 41359 9 yo Swim
	if test $hr -ge 41300 -a $hr -lt 41359
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoSwim.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 41400 - 41459 6 yo
	if test $hr -ge 41400 -a $hr -lt 41459
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 6yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 41500 - 41544 9 yo
	if test $hr -ge 41500 -a $hr -lt 41544
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 41545 - 41559 Dismissal Room
	if test $hr -ge 41545 -a $hr -lt 41559
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F Dismissal.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 41600 - 41759 After Camp
	if test $hr -ge 41600 -a $hr -lt 41759
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F AfterCamp.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 5 Friday
	
	# 50800 - 50854 Precamp
	if test $hr -ge 50800 -a $hr -lt 50854
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F Precamp.png &
		sleep 5
		# press q to quit feh
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 50855 - 50919 9 yo
	if test $hr -ge 50855 -a $hr -lt 50919
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 50920 - 50939 9 yo Breakfast
	if test $hr -ge 50920 -a $hr -lt 50939
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 50940 - 50959 9 yo
	if test $hr -ge 50940 -a $hr -lt 50959
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 51000 - 51059 11 & 12 yo
	if test $hr -ge 51000 -a $hr -lt 51059
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 11and12yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 51100 - 51159 10 yo
	if test $hr -ge 51100 -a $hr -lt 51159
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 10yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 51200 - 51219 9 yo
	if test $hr -ge 51200 -a $hr -lt 51219
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	
	# 51220 - 51239 9 yo Lunch
	if test $hr -ge 51220 -a $hr -lt 51239
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoLunch.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 51240 - 51259 9 yo Swim Prep
	if test $hr -ge 51240 -a $hr -lt 51259
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoSwimPrep.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 51300 - 51359 9 yo Swim
	if test $hr -ge 51300 -a $hr -lt 51359
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yoSwim.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 51400 - 51459 7 yo
	if test $hr -ge 51400 -a $hr -lt 51459
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 7yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 51500 - 51544 9 yo
	if test $hr -ge 51500 -a $hr -lt 51544
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 9yo.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 51545 - 51559 Dismissal Room
	if test $hr -ge 51545 -a $hr -lt 51559
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F Dismissal.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi


	# 51600 - 51759 After Camp
	if test $hr -ge 51600 -a $hr -lt 51759
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F AfterCamp.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

done
