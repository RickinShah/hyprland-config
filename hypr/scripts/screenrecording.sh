read -p "Do you want Audio(y/N): " audio
audio=${audio:-N}

printf "1. Fullscreen\n2. Window\n3. Custom\n"
read -p "Dimensions(Default: 1): " fullscreen
fullscreen=${fullscreen:-1}

if [[ $fullscreen == 1 ]]; then
	dimensions=""
elif [[ $fullscreen == 2 ]]; then
	printf "Keep Cursor on the window!"
	sleep 2
	dimensions='-g '$(hyprctl activewindow | grep -E "at: " | grep -oE "[0-9]+,[0-9]+")' '$(hyprctl activewindow | grep -E "size: " | grep -oE "[0-9]+,[0-9]+" | tr , x)
else
	dimensions='-g '"$(slurp -d)"
fi

echo "$dimensions"
$(notify-send -t 900 "Recording Starts in 1 seconds!")
sleep 1

if [[ $audio == [yY] ]]; then
	wf-recorder "$dimensions" -c h264_vaapi -C aac -d /dev/dri/renderD128 -a -f ~/Videos/Screencasts/Screencast_$(date "+%Y%m%d_%H%M%S.mp4")
elif [[ $audio == [nN] ]]; then
	wf-recorder "$dimensions" -c h264_vaapi -C aac -d /dev/dri/renderD128 -f ~/Videos/Screencasts/Screencast_$(date "+%Y%m%d_%H%M%S.mp4")
fi
