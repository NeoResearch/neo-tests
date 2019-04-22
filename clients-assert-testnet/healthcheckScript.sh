#!/bin/bash
[ "$(ls -A /opt/node/neo-cli/Storage)" ] && echo "Not Empty" || exit 1
[ "$(ls -A /opt/node/neo-cli/StorageComp)" ] && echo "Not Empty" || exit 1

if diff -rq /opt/node/neo-cli/Storage /opt/node/neo-cli/StorageComp | grep -q diff
then
   echo "Something is different"
   exit 1;
else
   echo "Nothing looks different"
   #exit 0;
fi
