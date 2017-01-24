#!/bin/bash

url="http://open-edx.vlabs.ac.in/"
output="benchmark.txt"
temp="temp-becnhmark.txt"
report="process-report.txt"
con=10
 
while [ "$con" -lt 200 ]
do 

req=500
while [ "$req" -lt 2000 ]
 do 
echo "##### Start benchmark for $con concurrent users and $req requests #####"
echo "##### Start benchmark for $con concurrent users and $req requests #####" >> $output

ab -c $con -n $req $url > $temp 
cat $temp >> $output

echo "##### Start benchmark for $con concurrent users and $req requests #####" >> $report

cat $temp | grep -E "^Time|Concurrency|Complete|Failed" >> $report 
echo "##### End benchmark for $con concurrent users and $req requests #####" >> $report

 req=`expr $req + 500`

echo "##### End benchmark for $con concurrent users and $req requests #####" >> $output
done
 con=`expr $con + 10`
done
