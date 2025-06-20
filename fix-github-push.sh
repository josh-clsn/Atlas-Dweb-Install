#!/bin/bash

# Script to fix GitHub push issues

echo "=== Fixing GitHub Push Issues ==="
echo ""

# Check current status
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
echo "You'll be prompted for your GitHub credentials."

# Try pushing to the master branch
git push -u origin master

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