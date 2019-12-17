#!/bin/sh

# Ref: $GHQ_ROOT/github.com/polybar/polybar-scripts/polybar-scripts/system-bluetooth-bluetoothctl

ICON_OFF=ᚼ
ICON_ON=ᛒ

bluetooth_print() {
  if bluetooth | grep off >/dev/null; then
    echo $ICON_OFF
    return
  fi

  bluetoothctl | while read -r; do
  if [ "$(systemctl is-active "bluetooth.service")" = "active" ]; then
    # Note: use Runic Font like 'junicode'
    echo $ICON_ON

    devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
    counter=0

    echo "$devices_paired" | while read -r line; do
    device_info=$(bluetoothctl info "$line")

    if echo "$device_info" | grep -q "Connected: yes"; then
      device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

      if [ $counter -gt 0 ]; then
        printf ", %s" "$device_alias"
      else
        printf " %s" "$device_alias"
      fi

      counter=$((counter + 1))
    fi

    printf '\n'
  done
else
  echo "see ${MYSCRIPTS}/bluetooth-stat.sh"
  fi
done
}

bluetooth_toggle() {
  if bluetooth | grep on >/dev/null; then
    __bluetoothctl_toggle
    echo
    echo "Bluetooth: Bluetooth is currently active"
    echo "Bluetooth: Turn off?"
    echo
    sudo bluetooth off
    notify-send --expire-time 3500 'Bluetooth: OFF'
  else
    echo
    echo "Bluetooth: Bluetooth is currently OFF"
    echo "Bluetooth: Turn on?"
    echo
    sudo bluetooth on
    __bluetoothctl_toggle
    notify-send --expire-time 3500 --urgency critical "Bluetooth: Activated"
  fi
}

__bluetoothctl_toggle() {
  if bluetoothctl show | grep -q "Powered: no"; then
    bluetoothctl power on >> /dev/null
    sleep 1

    devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
    echo "$devices_paired" | while read -r line; do
    bluetoothctl connect "$line" >> /dev/null

    if $line >/dev/null; then
      notify-send --expire-time 3500 --urgency critical "Bluetooth: $line is paired"
    fi
  done
else
  devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
  echo "$devices_paired" | while read -r line; do
  bluetoothctl disconnect "$line" >> /dev/null
done

bluetoothctl power off >> /dev/null
notify-send --expire-time 3500 'Bluetooth: No device is connected'
  fi
}

case "$1" in
  --toggle)
    bluetooth_toggle
    ;;
  *)
    bluetooth_print
    ;;
esac
