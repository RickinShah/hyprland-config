a=$(pamixer --get-volume)

if [ $a -ge 145 ] && [ $a -ne 150 ]; then
	$(volumectl -b -u -d set 150)
	paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga

elif [ $a -lt 150 ]; then
	$(volumectl -b -u -d up)
	paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
else
	$(volumectl -b -d -u set 150)
	paplay /usr/share/sounds/freedesktop/stereo/bell.oga
fi
