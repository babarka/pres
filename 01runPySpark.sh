#!/usr/bin/env bash
# brad barker - 4/21/2015 

hdfs dfs -rmr /user/cloudera/trans

pyspark ./pyspark_pres.py

