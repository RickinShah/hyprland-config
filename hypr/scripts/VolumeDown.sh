a=$(pamixer --get-volume)

$(volumectl -b -u -d down)
paplay /usr/share/sounds/freedesktop/stereo/audio-volume-change.oga
