# weeklyrotation.sh
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
	hr=`date +%H%M`
	dhm=`date +%u%H%M`
	
	# Schedule
	
	# Monday - Friday
	
	# 1300 - 1458 8-18 1p-2:58p
	if test $hr -ge 1300 -a $hr -lt 1458
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -FZY 8-18.png &
		sleep 5
		# press q to quit feh
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 1459 - 1558 8-9 2:59p-3:58
	if test $hr -ge 1459 -a $hr -lt 1558
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -FZY 1011and12.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 1559 - 1659 10-18 3:59p-4:59
	if test $hr -ge 1559 -a $hr -lt 1659
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -FZY 8and9.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 1700 - 1720 10-12 Dinner 5p-5:20p
	if test $hr -ge 1700 -a $hr -lt 1720
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -FZY 8and9Dinner.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 1721 - 1743 10-18 5:20p-5:43p
	if test $hr -ge 1721 -a $hr -lt 1743
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -FZY 8and9.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 1744 - 1759 Late Room 5:44p-5:59p
	if test $hr -ge 1744 -a $hr -lt 1759
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -FZY LateRoom.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# Evening Programs 6pm-8pm
	
	# 11800 - 11900 Maker Monday
	#if test $dhm -ge 11800 -a $hr -lt 11930
	#then
	#COUNTER=0
	#while [ $COUNTER -lt 5 ]; do
	#	feh -FZY MakerMonday.png &
	#	sleep 5
	#	xdotool key q
	#	
	#	sleep 6
	#	
	#	let COUNTER=COUNTER+1
	#done
	#fi
	
	
	
	
	# 21815 - 21900 (Teen Time/Tech Goes Home)
	#if test $dhm -ge 21800 -a $hr -lt 21900
	#then
	#COUNTER=0
	#while [ $COUNTER -lt 5 ]; do
	#	feh -FZY TeenTime.png &
	#	sleep 5
	#	xdotool key q
	#	
	#	sleep 6
	#	
	#	let COUNTER=COUNTER+1
	#done
	#fi
	
	
	
	# 3 Wednesday
	
	# 31800 - 31900 Robotics Club
	#if test $dhm -ge 31800 -a $hr -lt 31900
	#then
	#COUNTER=0
	#while [ $COUNTER -lt 5 ]; do
	#	feh -FZY RoboticsClub.png &
	#	sleep 5
	#	xdotool key q
	#	
	#	sleep 6
	#	
	#	let COUNTER=COUNTER+1
	#done
	#fi
	
	
	
	# 4 Thursday
	
	# 41815 - 41900 Teen Time
	#if test $dhm -ge 41800 -a $hr -lt 41900
	#then
	#COUNTER=0
	#while [ $COUNTER -lt 5 ]; do
	#	feh -FZY TeenTime.png &
	#	sleep 5
	#	xdotool key q
	#	
	#	sleep 6
	#	
	#	let COUNTER=COUNTER+1
	#done
	#fi
	
	
	
	# 5 Friday

	# 51800 - 51930 DJ
	if test $dhm -ge 51800 -a $hr -lt 51930
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -FZY DJEveningProgram.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

done