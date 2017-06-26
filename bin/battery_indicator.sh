#!/bin/bash
# modified from http://ficate.com/blog/2012/10/15/battery-life-in-the-land-of-tmux/

BOLT=''
BATTERY_FULL=''
BATTERY_THREE=''
BATTERY_HALF=''
BATTERY_QUARTER=''
BATTERY_EMPTY=''

if [[ `uname` == 'Linux' ]]; then
  current_charge=$(cat /proc/acpi/battery/BAT1/state | grep 'remaining capacity' | awk '{print $3}')
  total_charge=$(cat /proc/acpi/battery/BAT1/info | grep 'last full capacity' | awk '{print $4}')
else
  battery_info=`ioreg -rc AppleSmartBattery`
  current_charge=$(echo $battery_info | grep -o '"CurrentCapacity" = [0-9]\+' | awk '{print $3}')
  total_charge=$(echo $battery_info | grep -o '"MaxCapacity" = [0-9]\+' | awk '{print $3}')
  charging=$(echo $battery_info | grep -o '"ExternalConnected" = [a-zA-Z]\+ ' | awk '{print $3}')
fi

charged_slots=$(echo "((($current_charge/$total_charge)*10)/5)+1" | bc -l | cut -d '.' -f 1)
if [[ $charged_slots -gt 5 ]]; then
  charged_slots=5
fi

battery_percentage=$(echo "((($current_charge/$total_charge)*100))" | bc -l | cut -d '.' -f 1)
battery_slots=$(echo "(($battery_percentage/20+1))" | bc -l | cut -d '.' -f 1)

if [[ $battery_slots -eq 1 ]]; then
    echo -n '#[fg=red]'
else
    echo -n '#[fg=magenta]'
fi

echo -n $battery_percentage"% "

case $battery_slots in
1)
    echo -n "$BATTERY_EMPTY"
;;
2)
    echo -n "$BATTERY_QUARTER"
;;
3)
    echo -n "$BATTERY_HALF"
;;
4)  
    echo -n "$BATTERY_THREE"
;;
[56])
    echo -n "$BATTERY_FULL"
;;
*)
    echo -n "?"
esac

if [[ $charging == "Yes" ]]; then
    echo -n " $BOLT"
fi
