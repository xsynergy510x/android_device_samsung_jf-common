#!/system/bin/sh

on property:sys.boot_completed=1
	# Check if v4a is installed
	if grep -q v4a_fx /etc/audio_effects.conf; then
		# Delete busybox symbolic link if exists
		if [[ -e /system/bin/busybox_symbolic ]]; then
			rm /system/bin/busybox
			rm /system/bin/busybox_symbolic
		fi
	else # link busybox for v4a installation
		# Create dummy file to signify symbolic busybox and note delete user installed busybox
		touch /system/bin/busybox_symbolic
		ln -s /system/bin/toybox /system/bin/busybox
	fi
