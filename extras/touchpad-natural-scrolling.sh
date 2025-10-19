echo "Edit /usr/share/X11/xorg.conf.d/40-libinput.conf"
echo 'Add there Option "NaturalScrolling" "True" like this:' 
cat <<EOF
# Match on all types of devices but joysticks
Section "InputClass"
        Identifier "libinput pointer catchall"
        MatchIsPointer "on"
        MatchDevicePath "/dev/input/event*"
        Driver "libinput"
        Option "NaturalScrolling" "True"
EndSection
EOF
