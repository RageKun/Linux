#!/bin/bash

USER="rage"
PASS="1234"

# Optional keep-alive (for uptime robot)
python3 -m http.server 9999 &

# Start terminal
ttyd --port 10000 --credential $USER:$PASS bash
