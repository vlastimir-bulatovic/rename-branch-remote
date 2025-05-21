# Git Branch Rename Script

## Overview
This Bash script (`rename_branch.sh`) simplifies the process of renaming a Git branch both locally and on a remote repository. It prompts the user for the old and new branch names, performs the rename, deletes the old branch from the remote, and sets up the new branch with proper upstream tracking.

## Prerequisites
- **Git** installed and configured
- A Git repository with at least one branch
- Push access to the remote repository (default: `origin`)

## Usage
1. **Save the script**:
   - Copy the `rename_branch.sh` script to your project directory.

2. **Make the script executable**:
   ```bash
   chmod +x rename_branch.sh
   ```

3. **Run the script**:
   ```bash
   ./rename_branch.sh
   ```

4. **Follow the prompts**:
   - Enter the old branch name when prompted.
   - Enter the new branch name when prompted.

5. The script will:
   - Rename the local branch.
   - Delete the old branch from the remote.
   - Push the new branch to the remote.
   - Set the upstream tracking for the new branch.

## Example
```bash
$ ./rename_branch.sh
Enter the old branch name: feature/old
Enter the new branch name: feature/new
Branch successfully renamed from feature/old to feature/new and updated on origin
```

## Notes
- Ensure you are in the correct Git repository directory before running the script.
- The script assumes you have push access to the remote repository.
- Branch names should not include spaces or special characters that Git does not support.
- To change the default remote (`origin`), edit the `remote` variable in the script.

## Troubleshooting
- **Error: Failed to rename branch locally**: Ensure the old branch exists and you are on the correct branch or repository.
- **Error: Failed to delete old branch on remote**: Verify you have push access and the branch exists on the remote.
- **Error: Failed to push new branch to remote**: Check your network connection and repository permissions.

## License
This script is provided as-is, with no warranty. Feel free to modify and distribute as needed.
