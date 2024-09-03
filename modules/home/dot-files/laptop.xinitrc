while true; do
	# brightness=" $(~/scripts/xbacklight-log.py -get)%"
	
	battery0="$(cat /sys/class/power_supply/BAT0/capacity)"
	if [ "$(cat /sys/class/power_supply/BAT0/status)" == "Charging" ]; then
		battery0=" $battery0%"
	else	
		if (($battery0 >= 100)); then
			battery0=" $battery0%"
		elif (($battery0 >= 86)); then
			battery0=" $battery0%"
		elif (($battery0 >= 71)); then
			battery0=" $battery0%"
		elif (($battery0 >= 57)); then
			battery0=" $battery0%"
		elif (($battery0 >= 43)); then
			battery0=" $battery0%"
		elif (($battery0 >= 29)); then
			battery0=" $battery0%"
		elif (($battery0 >= 14)); then
			battery0=" $battery0%"
		else
			battery0=" $battery0%"
		fi
	fi
	
	battery1="$(cat /sys/class/power_supply/BAT1/capacity)"
	if [ "$(cat /sys/class/power_supply/BAT1/status)" == "Charging" ]; then
		battery1=" $battery1%"
	else	
		if (($battery1 >= 100)); then
			battery1=" $battery1%"
		elif (($battery1 >= 86)); then
			battery1=" $battery1%"
		elif (($battery1 >= 71)); then
			battery1=" $battery1%"
		elif (($battery1 >= 57)); then
			battery1=" $battery1%"
		elif (($battery1 >= 43)); then
			battery1=" $battery1%"
		elif (($battery1 >= 29)); then
			battery1=" $battery1%"
		elif (($battery1 >= 14)); then
			battery1=" $battery1%"
		else
			battery1=" $battery1%"
		fi
	fi

	volume="$(echo "$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{print $2}') * 100" | bc | awk -F. '{print $1}')"
	if [ $(wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep "[MUTED]" -c) = 1 ]; then
		volume=" $volume%"
	else
		if (($volume >= 66)); then
			volume=" $volume%"
		elif (($volume >= 33)); then
			volume=" $volume%"
		else
			volume=" $volume%"
		fi 
	fi

	date=$(date "+%-m/%-d/%Y")
	time=$(date "+%-I:%M %p")
	xsetroot -name "$battery0 $battery1  $volume  $date  $time "
done &

feh --bg-fill .wallpaper.jpg

xcompmgr &

# xrandr --output HDMI-0 --mode 1920x1080 --rate 74.97

exec dwm
