#!/bin/bash
if diff -rq StorageBase StorageNew | grep -q diff
then
   echo "Something is different"
   #exit 1;
else
   echo "Nothing looks different"
   #exit 0;
fi
