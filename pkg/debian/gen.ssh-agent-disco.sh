#!/bin/bash

cat << EOF
# ssh-agent-disco - ssh-agent for Disco

description "ssh-agent for disco user"
author "Justin Van Winkle <jvanwinkle@ebay.com>"


setuid disco
umask 077 # so the env file is only user-readable
start on runlevel [2345]
stop on runlevel [016]
respawn
expect fork
exec ssh-agent -a ~disco/.ssh-agent.socket > ~disco/.ssh-agent.env
EOF
