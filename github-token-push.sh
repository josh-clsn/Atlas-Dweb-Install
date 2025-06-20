#!/bin/bash

# Script to push to GitHub using a personal access token

echo "=== GitHub Push with Personal Access Token ==="
echo ""

echo "You need a GitHub Personal Access Token to push your code."
echo "If you don't have one yet, create it at: https://github.com/settings/tokens"
echo "Make sure to give it 'repo' permissions."
echo ""

# Ask for the token
echo "Please enter your GitHub Personal Access Token:"
read -s github_token

# Update the remote URL to include the token
echo ""
echo "Updating remote URL with your token..."
git remote set-url origin "https://$github_token@github.com/josh-clsn/Atlas-Dweb-Install.git"

# Check current status
echo ""
echo "Current Git status:"
git status

# Ensure all files are added
echo ""
echo "Adding all files to Git..."
git add -A

# Check if there are changes to commit
if git diff-index --quiet HEAD --; then
    echo "No changes to commit. All files are already committed."
else
    echo "Committing changes..."
    git commit -m "Update Dweb Installer files"
fi

# Push to GitHub
echo ""
echo "Pushing to GitHub..."
git push -u origin master

# Reset the remote URL to remove the token (for security)
echo ""
echo "Cleaning up (removing token from git config)..."
git remote set-url origin "https://github.com/josh-clsn/Atlas-Dweb-Install.git"

echo ""
echo "If the push was successful, you can now create a release:"
echo "1. Go to https://github.com/josh-clsn/Atlas-Dweb-Install"
echo "2. Click on 'Releases' on the right side"
echo "3. Click 'Create a new release'"
echo "4. Set a tag version (e.g., v1.0.0)"
echo "5. Set a release title (e.g., 'Initial Release')"
echo "6. Copy and paste the content from release-template.md into the description"
echo "7. Attach the Dweb-Installer.exe file"
echo "8. Click 'Publish release'" 