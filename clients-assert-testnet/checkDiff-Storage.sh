#!/bin/bash
if [ "$(ls -A ./StorageNew)" ]; then
   echo "Not Empty";
else
   echo "Empty";
   exit 1;
fi

if [ "$(ls -A ./StorageBase)" ]; then
   echo "Not Empty";
else
   echo "Empty";
   exit 1;
fi

if diff -rq StorageNew StorageBase | grep -q diff
then
   echo "Something is different"
   diff -rq StorageNew StorageBase | grep diff
   #exit 1;
else
   echo "Nothing looks different"
   #exit 0;
fi
