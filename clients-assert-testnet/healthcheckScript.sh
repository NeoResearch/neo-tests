#!/bin/bash
if diff -rq /opt/node/neo-cli/Storage /opt/node/neo-cli/StorageComp | grep -q diff
then
   echo "Something is different"
   exit 1;
else
   echo "Nothing looks different"
   #exit 0;
fi
