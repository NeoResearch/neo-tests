#!/bin/bash
echo "converting logs script"

echo "// log1" > log1.logjs
echo "let textlog1=\`" >> log1.logjs
if [ `cat log1.log | grep initialize | grep index=0 | wc -l` -eq 0 ]; then
    echo "ERROR: no information in log1 corresponding to initialize index=0 (verify if order is correct)"
else
    cat log1.log | tail -n 50 >> log1.logjs
fi
echo "\`;" >> log1.logjs

echo "// log2" > log2.logjs
echo "let textlog2=\`" >> log2.logjs
if [ `cat log2.log | grep initialize | grep index=1 | wc -l` -eq 0 ]; then
    echo "ERROR: no information in log2 corresponding to initialize index=1 (verify if order is correct)"
else
    cat log2.log | tail -n 50 >> log2.logjs
fi
echo "\`;" >> log2.logjs

echo "// log3" > log3.logjs
echo "let textlog3=\`" >> log3.logjs
if [ `cat log3.log | grep initialize | grep index=2 | wc -l` -eq 0 ]; then
    echo "ERROR: no information in log3 corresponding to initialize index=2 (verify if order is correct)"
else
    cat log3.log | tail -n 50 >> log3.logjs
fi
echo "\`;" >> log3.logjs

echo "// log4" > log4.logjs
echo "let textlog4=\`" >> log4.logjs
if [ `cat log4.log | grep initialize | grep index=3 | wc -l` -eq 0 ]; then
    echo "ERROR: no information in log4 corresponding to initialize index=3 (verify if order is correct)"
else
    cat log4.log | tail -n 50 >> log4.logjs
fi
echo "\`;" >> log4.logjs
