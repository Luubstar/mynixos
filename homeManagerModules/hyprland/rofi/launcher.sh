#!/usr/bin/env bash
rofi \
	-show drun \
	-modi run,drun,ssh \
	-scroll-method 0 \
	-drun-match-fields all \
	-drun-display-format "{name}" \
	-no-drun-show-actions \
	-terminal kitty \
	-kb-cancel Escape \
	-theme ~/NixOs-Conf/homeManagerModules/hyprland/rofi/launcher.rasi
