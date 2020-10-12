#!/usr/bin/env bash

CURRENT=${0}
TOOLS_DIR=$(cd $(dirname $CURRENT); pwd)

echo "

PATH=$TOOLS_DIR/bin:\$PATH
if [ -d $TOOLS_DIR/functions ]
then
  for f in $TOOLS_DIR/functions/*.bash $TOOLS_DIR/functions/*.sh
  do
    if [ -r \$f ]
    then
      . \$f
    fi
  done
fi
unset f

" > /etc/profile.d/daring-ec2-tools.sh
