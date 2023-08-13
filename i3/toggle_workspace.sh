#!/bin/bash

# Set the name of the target workspace
target_workspace="GPT"

# Get the ID of the currently focused workspace
current_workspace=$(i3-msg -t get_workspaces | jq '.[] | select(.focused==true).name')

# Check if the current workspace is the target workspace
if [ "$current_workspace" == "\"$target_workspace\"" ]; then
    # If it is, switch to the last workspace (toggle back)
    i3-msg workspace number $(cat /tmp/last_workspace)
else
    # If it's not, switch to the target workspace and save the current workspace ID
    i3-msg workspace $target_workspace
    echo $current_workspace > /tmp/last_workspace
fi

