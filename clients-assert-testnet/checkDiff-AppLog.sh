#!/bin/bash
if [ "$(ls -A ./AppLogNew)" ]; then
   echo "Not Empty";
else
   echo "Empty";
   exit 1;
fi

if [ "$(ls -A ./AppLogBase)" ]; then
   echo "Not Empty";
else
   echo "Empty";
   exit 1;
fi

if diff -x 'LOG' -x 'MANIFEST*' -x 'CURRENT' -x 'LOCK' -rq AppLogNew AppLogBase | grep -q diff
then
   echo "Something is different"
   diff -x 'LOG' -x 'MANIFEST*' -x 'CURRENT' -x 'LOCK' -rq AppLogNew AppLogBase | grep diff
   #exit 1;
else
   echo "Nothing looks different"
   #exit 0;
fi

# diff -x 'LOG' -x 'MANIFEST*' -x 'CURRENT' -x 'LOCK' -rq ChainNew ChainBase | grep diff
