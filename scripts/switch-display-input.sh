#!/bin/sh

# Get the input source
current_vcp=$(ddcutil getvcp 60)

if echo "$current_vcp" | grep -q "0x0f"; then
    ddcutil setvcp 60 0x11    # Display Port
else
    ddcutil setvcp 60 0x0f    # HDMI
fi
