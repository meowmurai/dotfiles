#!/bin/bash

perl $HOME/.config/i3/i3subscribe.pl window | while read -r event; do
# This will disable the borders on all other windows
    i3-msg '[class="^.*"] title_window_icon no';
# set the border
    i3-msg 'title_window_icon padding 6px';
done
