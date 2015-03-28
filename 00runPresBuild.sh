#!/usr/bin/env bash
# (c) 2015 copyright brad barker - sample code not supported
# all rights reserved may not be copied or published without permission

# delete everything prior to running
rm -f speeches pages.txt addresses.txt bigdat.gz
rm -rf ./dat 
hdfs dfs -rmr /user/cloudera/pres

# get web pages source
wget http://millercenter.org/president/speeches

# extract the web pages 
grep speeches -e 'Inaugural' | cut -d'"' -f4 > pages.txt
sed 's|^|http://millercenter.org|' pages.txt > addresses.txt
wget -i addresses.txt -P ./dat/

# put into hdfs folder for pres
hdfs dfs -mkdir /user/cloudera/pres/
cat ./dat/* > bigdat
gzip bigdat
hdfs dfs -put bigdat.gz /user/cloudera/pres/
