#!/bin/bash
# Run from inside the project folder after creating an EMPTY repo on GitHub.
# Usage: ./push-to-github.sh https://github.com/<your-username>/aws-ec2-apache-web-server.git
set -e
REPO_URL="${1:?Pass your GitHub repo URL as the first argument}"

git init
git branch -M main

git add README.md LICENSE .gitignore
git commit -m "docs: add README, license and gitignore"

git add scripts/
git commit -m "feat: add EC2 User Data script to install and configure Apache"

git add website/
git commit -m "feat: add sample index.html web page"

git add docs/
git commit -m "docs: add PDF guide and troubleshooting notes"

git remote add origin "$REPO_URL"
git push -u origin main
