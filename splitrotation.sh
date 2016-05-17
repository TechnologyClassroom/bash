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
	
	# 11300 - 11444 8-18
	if test $hr -ge 11300 -a $hr -lt 11444
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8-18.png &
		sleep 5
		# press q to quit feh
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 11445 - 11613 10-12
	if test $hr -ge 11445 -a $hr -lt 11613
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 1011and12.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 11614 - 11644 8-9
	if test $hr -ge 11614 -a $hr -lt 11644
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8and9.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 11645 - 11704 8-9 Dinner
	if test $hr -ge 11645 -a $hr -lt 11704
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8and9Dinner.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 11705 - 11744 8-9
	if test $hr -ge 11705 -a $hr -lt 11744
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8and9.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 11745 - 11759 Late Room
	if test $hr -ge 11745 -a $hr -lt 11759
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F LateRoom.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 11800 - 11900 Maker Monday
	if test $hr -ge 11800 -a $hr -lt 11930
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F MakerMonday.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi
	
	
	
	# 2 Tuesday
	
	# 21300 - 21444 8-18
	if test $hr -ge 21300 -a $hr -lt 21444
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8-18.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi
	
	# 21445 - 21613 10-12
	if test $hr -ge 21445 -a $hr -lt 21613
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 1011and12.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi
	
	# 21614 - 21724 Teen Time
	if test $hr -ge 21614 -a $hr -lt 21724
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F TeenTime.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 21725 - 21744 Teen Dinner
	if test $hr -ge 21725 -a $hr -lt 21744
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F TeenDinner.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 21745 - 21814 Late Room
	if test $hr -ge 21745 -a $hr -lt 21759
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F LateRoom.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi
	
	# 21815 - 21900 (Teen Time/Tech Goes Home)
	if test $hr -ge 21800 -a $hr -lt 21900
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F TeenTime.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi
	
	
	
	# 3 Wednesday
	
	# 31300 - 31444 8-18
	if test $hr -ge 31300 -a $hr -lt 31444
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8-18.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 31445 - 31613 10-12
	if test $hr -ge 31445 -a $hr -lt 31613
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 1011and12.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 31614 - 31644 8-9
	if test $hr -ge 31614 -a $hr -lt 31644
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8and9.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 31645 - 31704 8-9 Dinner
	if test $hr -ge 31645 -a $hr -lt 31704
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8and9Dinner.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 31705 - 31744 8-9
	if test $hr -ge 31705 -a $hr -lt 31744
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8and9.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 31745 - 31759 Late Room
	if test $hr -ge 31745 -a $hr -lt 31759
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F LateRoom.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 31800 - 31900 Robotics Club
	if test $hr -ge 31800 -a $hr -lt 31900
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F RoboticsClub.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi
	
	
	
	# 4 Thursday

	# 41300 - 41444 8-18
	if test $hr -ge 41300 -a $hr -lt 41444
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8-18.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi
	
	# 41445 - 41613 10-12
	if test $hr -ge 41445 -a $hr -lt 41613
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 1011and12.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi
	
	# 41614 - 41724 Teen Time
	if test $hr -ge 41614 -a $hr -lt 41724
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F TeenTime.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 41725 - 41744 Teen Dinner
	if test $hr -ge 41725 -a $hr -lt 41744
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F TeenDinner.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 41745 - 41814 Late Room
	if test $hr -ge 41745 -a $hr -lt 41759
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F LateRoom.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi
	
	# 41815 - 41900 Teen Time
	if test $hr -ge 41800 -a $hr -lt 41900
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F TeenTime.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi
	
	
	
	# 5 Friday

	# 51300 - 51444 8-18
	if test $hr -ge 51300 -a $hr -lt 51444
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8-18.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 51445 - 51613 10-12
	if test $hr -ge 51445 -a $hr -lt 51613
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 1011and12.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 51614 - 51644 8-9
	if test $hr -ge 51614 -a $hr -lt 51644
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8and9.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 51645 - 51704 8-9 Dinner
	if test $hr -ge 51645 -a $hr -lt 51704
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8and9Dinner.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 51705 - 51744 8-9
	if test $hr -ge 51705 -a $hr -lt 51744
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F 8and9.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 51745 - 51759 Late Room
	if test $hr -ge 51745 -a $hr -lt 51759
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F LateRoom.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

	# 51800 - 51930 DJ
	if test $hr -ge 51800 -a $hr -lt 51930
	then
	COUNTER=0
	while [ $COUNTER -lt 5 ]; do
		feh -F DJEveningProgram.png &
		sleep 5
		xdotool key q
		
		sleep 6
		
		let COUNTER=COUNTER+1
	done
	fi

done