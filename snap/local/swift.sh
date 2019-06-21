#!/bin/sh

export PATH="${PATH:+${PATH}:}$SNAP/bin:$SNAP/usr/bin"

$SNAP/usr/bin/swift "$@"
