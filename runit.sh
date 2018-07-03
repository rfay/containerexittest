#!/bin/bash

echo "This starts the container. You can hit ctrl-c or hit it with a SIGTERM for normal shutdown, or do a docker stop"
echo "All of those will behave predictably - the container will get a chance to clean up, you'll see the output from the shell script"
echo "However, if you exit docker, no chance is given"

docker run -it randyfay/containerexittest

