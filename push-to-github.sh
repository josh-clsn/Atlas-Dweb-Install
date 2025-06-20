#!/bin/bash

# Script to help push the Dweb Installer project to GitHub

echo "=== Dweb Installer GitHub Setup ==="
echo ""

# Check if git is installed
if ! command -v git &> /dev/null; then
    echo "Error: Git is not installed. Please install Git first."
    exit 1
fi

# Initialize git repository if not already initialized
if [ ! -d .git ]; then
    echo "Initializing Git repository..."
    git init
    echo "Git repository initialized."
else
    echo "Git repository already initialized."
fi

# Check git status
echo ""
echo "Current Git status:"
git status

# Ask for GitHub repository details
echo ""
echo "Please enter your GitHub username:"
read github_username

echo "Please enter the name for your new GitHub repository:"
read repo_name

echo ""
echo "Would you like to create a new repository on GitHub? (y/n)"
read create_repo

if [ "$create_repo" == "y" ] || [ "$create_repo" == "Y" ]; then
    echo "To create a repository on GitHub, please:"
    echo "1. Go to https://github.com/new"
    echo "2. Enter '$repo_name' as the repository name"
    echo "3. Add a description (optional)"
    echo "4. Choose public or private"
    echo "5. Do NOT initialize with README, .gitignore, or license"
    echo "6. Click 'Create repository'"
    echo ""
    echo "Press Enter when you've created the repository..."
    read -p ""
fi

# Add all files to git
echo ""
echo "Adding files to Git..."
git add .

# Commit changes
echo ""
echo "Committing files..."
git commit -m "Initial commit of Dweb Installer"

# Add GitHub remote
echo ""
echo "Adding GitHub remote..."
git remote add origin "https://github.com/$github_username/$repo_name.git"

# Push to GitHub
echo ""
echo "Pushing to GitHub..."
echo "You'll be prompted for your GitHub credentials."
git push -u origin main || git push -u origin master

echo ""
echo "=== Next Steps ==="
echo "1. Go to https://github.com/$github_username/$repo_name"
echo "2. Click on 'Releases' on the right side"
echo "3. Click 'Create a new release'"
echo "4. Set a tag version (e.g., v1.0.0)"
echo "5. Set a release title (e.g., 'Initial Release')"
echo "6. Add a description"
echo "7. Attach the Dweb-Installer.exe file"
echo "8. Copy and paste the checksum from checksums/Dweb-Installer.exe.sha256"
echo "9. Click 'Publish release'"
echo ""
echo "Done! Your Dweb Installer is now on GitHub." 