#!/usr/bin/env bash

set -f
GROUPID=$1
GROUPINFO=$(getent group $GROUPID)

# okay if no user
if [ $? -ne 0 ]; then
    echo "No group exists with id $GROUPID"
    exit 0
fi

# turn group info into a space-separated array and extract the first element
GROUPINFO=(${GROUPINFO//:/ })
GROUPNAME="${GROUPINFO[0]}"

echo "Removing group $GROUPNAME with conflicting id $GROUPID"
groupdel $GROUPNAME
