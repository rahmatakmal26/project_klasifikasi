#!/bin/bash

# Install dependencies
pip install --no-cache-dir -r requirements.txt -t .vercel_build_output

# Navigate to build output directory
cd .vercel_build_output

# Remove unnecessary files
find . -type d -name '__pycache__' -exec rm -rf {} +
find . -type f -name '*.py[co]' -delete
find . -type f -name '*.so' -delete
find . -type f -name '*.h5' -delete
find . -type f -name '*.pkl' -delete

# Go back to root and move build output
cd ..
mv .vercel_build_output .vercel/output/function