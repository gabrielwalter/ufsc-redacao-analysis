#!/bin/bash

set -e

echo "🔨 Building project..."
DEPLOY_BASE=/ufsc-redacao/ pnpm run build

echo "📦 Copying files to site repository..."
rm -rf ../site-gabrielhando/ufsc-redacao/*
cp -r dist/public/* ../site-gabrielhando/ufsc-redacao/

echo "📤 Deploying to GitHub..."
cd ../site-gabrielhando
git add ufsc-redacao/
git commit -m "Deploy: Update ufsc-redacao app" || echo "No changes to commit"
git push

echo "✅ Deploy complete! Wait a few minutes for Hostinger to update."
