# Race Condition in Bash Script

This repository demonstrates a race condition bug in a bash script that increments a counter concurrently.  Two processes attempt to increment a shared variable simultaneously, leading to unpredictable results.

The `bug.sh` file contains the buggy code.  The `bugSolution.sh` file provides a corrected version using a lock file to prevent race conditions.

This example highlights the importance of careful synchronization in concurrent programming, even in seemingly simple shell scripts.