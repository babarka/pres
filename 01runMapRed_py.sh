#!/usr/bin/env bash
# brad barker - 4/21/2015 

hdfs dfs -rmr /user/cloudera/trans

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
-input /user/cloudera/pres  -output /user/cloudera/trans \
-file ./mapper.py -file ./reducer.py \
-mapper ./mapper.py -reducer ./reducer.py


