#!/bin/bash

# Script to rename a Git branch locally and on remote

# Define the remote (default is origin)
remote=origin

# Prompt for old branch name
read -p "Enter the old branch name: " old_name

# Check if old_name is empty
if [ -z "$old_name" ]; then
    echo "Error: Old branch name cannot be empty."
    exit 1
fi

# Prompt for new branch name
read -p "Enter the new branch name: " new_name

# Check if new_name is empty
if [ -z "$new_name" ]; then
    echo "Error: New branch name cannot be empty."
    exit 1
fi

# Rename the local branch
git branch -m $old_name $new_name || { echo "Error: Failed to rename branch locally."; exit 1; }

# Delete the old branch on remote
git push $remote --delete $old_name || { echo "Error: Failed to delete old branch on remote."; exit 1; }

# Unset the upstream to prevent using old name
git branch --unset-upstream $new_name || { echo "Error: Failed to unset upstream."; exit 1; }

# Push the new branch to remote
git push $remote $new_name || { echo "Error: Failed to push new branch to remote."; exit 1; }

# Set the upstream branch for the new local branch
git push $remote -u $new_name || { echo "Error: Failed to set upstream for new branch."; exit 1; }

echo "Branch successfully renamed from $old_name to $new_name and updated on $remote"
