#!/bin/bash

# check if we are running on a PE server
hostnamectl | grep 'Operating System: Ubuntu'

if [ $? -eq 0 ]
then
  echo 'ubuntu'
  command='dpkg -l'
else
  echo 'redhat'
  command='rpm -qa'
fi

$command | grep pe-puppetserver

if [ $? -eq 0 ]
then
  echo "Bailing out: Running on PE server"
  exit 1
fi

# check if connectivity check is bypassed
if [ $PT_bypass_connectivity_check == "true" ]
then
  echo "Connectivity check bypassed"
  exit 0
fi

# Was oringally checking ports with curl. However RHEL7 curl behaves differently. Have moved to using /dev/tcp socket. 
# RHEL7 was pushing non UTF8 charaters to stdout which broken the task. This method below may not work on non RHEL\debain hosts. If using them this may need to be updated. 
# Check port 8140
timeout 1 bash -c "cat < /dev/null > /dev/tcp/$PT_target_pe_server/8140"
if [ $? -ne 0 ]
then
  echo "Port 8140 not open"
  exit 1
fi

# Check port 8142
timeout 1 bash -c "cat < /dev/null > /dev/tcp/$PT_target_pe_server/8142"
if [ $? -ne 0 ]
then
  echo "Port 8142 not open"
  exit 1
fi

exit 0