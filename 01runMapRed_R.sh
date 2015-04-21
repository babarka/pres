#!/usr/bin/env bash
# brad barker - 4/21/2015

hdfs dfs -rmr /user/cloudera/trans

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
-input /user/cloudera/pres  -output /user/cloudera/trans \
-file ./mapper.R -file ./reducer.R \
-mapper ./mapper.R -reducer ./reducer.R


