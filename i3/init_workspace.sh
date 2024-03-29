#!/bin/bash

# install wmctrl. Its a prerequisite to make this script work.

# Launch it in your i3 config file
# exec --no-startup-id ~/.config/i3/init_workspace.sh
# init_workspace.sh must be executable

# App you want to start :
apps=(
 "uxterm",
 "firefox",
 "okular",
 "FBReader"
)

# Which workspace to assign
workspaces=(
"1",
"1",
"3",
"4"
)

# counter of opened windows
owNB=0

# add paths of apps to array
arr=()
arr+=( '/usr/bin/' )

for iwin in ${!apps[*]}
do
    while [ "$owNB" -lt "$iwin" ] # wait before start other programs
    do
        owNB=$(wmctrl -l | wc -l) # Get number of actual opened windows
    done

    i3-msg workspace ${workspaces[$iwin]} # move in wanted workspace
    ${arr[$iwin]}/${apps[$iwin]} & # start the wanted app
done
