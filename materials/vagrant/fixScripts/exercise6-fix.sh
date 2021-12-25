#!/bin/bash
count=0
if [ $HOSTNAME == server1 ]
then
  echo "start copy from $HOSTNAME server to server2 "
  for i in "${@:1:$# - 1}"
  do
    echo "Copy file" $i to "${@: -1}" "on remote server"
    scp $i server2:"${@: -1}"
    count=$((count + $(ls -la $i | awk '{print $5}')))
  done
else
  echo "start copy from $HOSTNAME server to server1 "
  for i in "${@:1:$# - 1}"
  do
    echo "Copy file" $i to "${@: -1}" "on remote server"
    scp $i server1:"${@: -1}"
    count=$((count + $(ls -la $i | awk '{print $5}')))
  done
fi
echo $count
