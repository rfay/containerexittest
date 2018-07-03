# Docker Container Exit Test

This repo exists just to demonstrate a bug in docker-for-windows and docker-for-mac. If you exit docker in either of those, containers do not get terminated - they don't get a chance to clean up, which can have devastating consequences on data.

1. Create the demo docker image by running ./buildit.sh. (Or just use the randyfay/containerexittest repo on dockerhub).
2. Run the container by running ./runit.sh. This runs the very simple script in start.sh, which catches a signal, notifies about it, sleeps and then exits.

**Now to demonstrate expected behavior:**

1. Use `docker stop` on the container - you'll see the script catch the SIGTERM and behave correctly.
2. Use `docker kill -s 15` on the container, again you'll see the script catch the SIGTERM, wait and exit.

**Now to demonstrate the bad behavior:**

On Docker for Windows or Docker for Mac, with the container running, exit docker. You'll see no catch, the container is just terminated. To make sure, you can restart docker and then issue `docker logs` on the stopped container. No signal-catch behavior is demonstrated.

**Why does this matter?**

Any container that deals in persistent data is going to have horrible trouble as a result. Docker needs to terminate containers and not just die.