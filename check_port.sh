#!/usr/bin/env bash
# Check if the TCP port is open.
# debian@debian:~/workspace$ bash check_port.sh 8000
(lsof -Pi :$1 -sTCP:LISTEN -t >/dev/null) && echo "TCP port $1 open" || echo "TCP port $1 not open"
