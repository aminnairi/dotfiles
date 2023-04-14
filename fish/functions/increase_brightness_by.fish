function increase_brightness_by --argument-names amount
  set --local brightness (cat /sys/class/backlight/*/brightness)
  set --local brightness_increased (math $brightness + $amount)
  echo $brightness_increased | sudo tee /sys/class/backlight/*/brightness > /dev/null
end
