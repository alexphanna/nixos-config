while true; do
	# brightness=" $(~/scripts/xbacklight-log.py -get)%"
	
	battery="$(printf "%.0f" $(echo "($(cat /sys/class/power_supply/BAT0/energy_now) + $(cat /sys/class/power_supply/BAT1/energy_now)) / ($(cat /sys/class/power_supply/BAT0/energy_full) + $(cat /sys/class/power_supply/BAT1/energy_full))* 100" | bc -l))"
	if [ "$(cat /sys/class/power_supply/BAT1/status)" == "Charging" ] || [ "$(cat /sys/class/power_supply/BAT1/status)" == "Charging" ]; then
		battery=" $battery%"
	else	
		if (($battery >= 100)); then
			battery=" $battery%"
		elif (($battery >= 86)); then
			battery=" $battery%"
		elif (($battery >= 71)); then
			battery=" $battery%"
		elif (($battery >= 57)); then
			battery=" $battery%"
		elif (($battery >= 43)); then
			battery=" $battery%"
		elif (($battery >= 29)); then
			battery=" $battery%"
		elif (($battery >= 14)); then
			battery=" $battery%"
		else
			battery=" $battery%"
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
	xsetroot -name "$battery  $volume  $date  $time "
done &

feh --bg-fill .wallpaper.jpg

xcompmgr &

# xrandr --output HDMI-0 --mode 1920x1080 --rate 74.97

exec dwm
