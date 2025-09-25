#!/usr/bin/env sh

# Turn off fan rgb
openrgb --noautoconnect -d "MSI B550-A PRO (MS-7C56)" -c 000000 -b 100 -m static &

# Turn off monitor
xset dpms force off