function set_brightness --argument-names amount
  echo $amount | sudo tee /sys/class/backlight/*/brightness > /dev/null
end
