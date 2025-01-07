#!/bin/bash

# This script demonstrates a race condition bug.

counter=0

function increment_counter() {
  local i=1
  while [ $i -le 10000 ]; do
    counter=$((counter + 1))
    i=$((i + 1))
  done
}

# Create two processes that increment the counter concurrently
increment_counter &
increment_counter &

# Wait for both processes to finish
wait

# Print the final counter value
echo "Final counter value: $counter"