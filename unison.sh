#!/usr/bin/env bash

# Start process on path which we want to sync
[ ! -d $UNISON_DIR ] && mkdir -p $UNISON_DIR >> /dev/null 2>&1
[ ! -z $UNISON_DIR_OWNER ] && chown $UNISON_DIR_OWNER $UNISON_DIR >> /dev/null 2>&1
cd $UNISON_DIR

# Gracefully stop the process on 'docker stop'
trap 'kill -TERM $PID' TERM INT

# Run unison server
unison -socket 5000 &

# Wait until the process is stopped
PID=$!
wait $PID
trap - TERM INT
wait $PID