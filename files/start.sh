#!/bin/sh

set -x
set -o errexit

echo "Test container starting up"

function finish() {
    echo "finish called (received signal)"
    sleep 5
    echo "Now exiting"
    exit 0
}

trap finish SIGTERM SIGINT

sleep 999999 &
pid=$1
wait $pid