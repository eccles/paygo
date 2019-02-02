#!/bin/sh
#
# Create the .env file
USER_ID=$( id -u )
GROUP_ID=$( id -g )
cat > .env << EOF
USER_ID=${USER_ID}
GROUP_ID=${GROUP_ID}
EOF
