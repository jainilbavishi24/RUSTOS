#!/bin/bash

# Build the bootimage
echo "Building bootimage..."
cargo bootimage
if [ $? -ne 0 ]; then
  echo "Build failed!"
  exit 1
fi

# Path to the generated bootimage file
IMAGE="target/x86_64-blog_os/debug/bootimage-blog_os.bin"

# Check if image exists
if [ ! -f "$IMAGE" ]; then
  echo "Bootimage not found at $IMAGE"
  exit 1
fi

# Run QEMU with serial output to stdio
echo "Starting QEMU with serial output..."
qemu-system-x86_64 -drive format=raw,file="$IMAGE" -serial stdio
