#!/bin/bash

# This script demonstrates a solution to the race condition bug using a lock file.

counter=0
lock_file="counter.lock"

function increment_counter() {
  local i=1
  while [ $i -le 10000 ]; do
    flock -n $lock_file || exit 1 # Acquire lock, exit if failed
    counter=$((counter + 1))
    echo $counter > counter.txt
    flock -u $lock_file # Release lock
    i=$((i + 1))
  done
}

# Create two processes that increment the counter concurrently
increment_counter &
increment_counter &

# Wait for both processes to finish
wait

# Print the final counter value
cat counter.txt