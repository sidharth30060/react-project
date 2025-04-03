#!/bin/bash

# Define the versions in reverse order
versions=("v1" "v2" "v3" "v4")

# Loop through versions in reverse order
for ((i=${#versions[@]}-2; i>=0; i--)); do
    src="src/${versions[i]}"
    dest="src/${versions[i+1]}"

    # Check if source directory exists
    if [ ! -d "$src" ]; then
        echo "❌ Error: Source directory $src does not exist!"
        exit 1
    fi

    # Ensure destination folder exists
    mkdir -p "$dest"

    # Copy all files from src to dest
    cp -r "$src/"* "$dest/" 2>/dev/null || echo "⚠️ Warning: No files copied from $src"

    echo "✅ Copied contents from $src to $dest"

    # Replace version strings inside files
    find "$dest" -type f -exec sed -i "s/This is ${versions[i]}/This is ${versions[i+1]}/g" {} +

    echo "✅ Updated version strings in $dest"

    # Show changed files
    git diff --stat "$dest"
done

echo "✅ Version update script completed!"
