#!/usr/bin/env bash
# (c) copyright 2015 brad barker - sample code not supported
# all rights reserved may not be copied or published without permission

hdfs dfs -rmr /user/cloudera/trans

hadoop jar /usr/lib/hadoop-mapreduce/hadoop-streaming.jar \
-input /user/cloudera/pres  -output /user/cloudera/trans \
-file ./mapper.py -file ./reducer.py \
-mapper ./mapper.py -reducer ./reducer.py


