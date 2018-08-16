#!/bin/bash
echo "generating basic example"
cd getremotelog
cp log1.log_ log1.log
cp log2.log_ log2.log
cp log3.log_ log3.log
cp log4.log_ log4.log
./convertlogstojs.sh
cd ..
echo "finished!"
