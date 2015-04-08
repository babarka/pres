Submitted as potential [blog](https://docs.google.com/a/cloudera.com/document/d/1RYA0PVeJulhkR9P68nk8gvcWZue4155TChJehFh5AE4/edit?usp=sharing) entry. 



# Presidential Inaugural Speeches

This analysis is provided as simple process to demonstrate data flow within Cloudera`s Enterprise Hub (EDH). The analysis is to determine if presidential inaugural speeches have become more "democratized" by evaluating the occurance of we/us vs me/I in presidential inaugural speeches over time.

# Data Ingest  

 To make the example replicable, the data will be pulled from a collection of presidential speeches provided by the [Miller Center](http://millercenter.org/president/speeches). To load data

    ./00runPresBuild.sh

# Batch Processing

 There is unique data by document; document id, presidents name, and year (id,pres,year). We will also exract counts of the words {we,us} as we and {me, i} as me. To run map reduce and load hive metadata:

    ./01runMapRed.sh
    ./hive -f createTableTrans.hql

# Analytic SQL

There really isn't code to run here, users are expected to discover including use of HUE. Remember to invalidate metadata.

# 3rd Party Application


 To demonstrate the data is readily available for 3rd party applications / external use, run an R script which will show the correlation of year and we/(we+me):

    ./02impAnalysis.R
