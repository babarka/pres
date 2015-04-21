
# Presidential Inaugural Speeches

This analysis is provided as simple process to demonstrate methods for handeling data within Cloudera`s Enterprise Hub (EDH). The analysis is to determine if presidential inaugural speeches have become more "democratized" by evaluating the occurance of first person to first and second person in presidential inaugural speeches over time.

# Data Ingest  

 To make the example replicable, the data will be pulled from a collection of presidential speeches provided by the [Miller Center](http://millercenter.org/president/speeches). To load data

    ./00runPresBuild.sh

# Batch Processing

 There is unique data by document; document id, presidents name, and year (id,pres,year). We will also exract counts of the words {we,us} as we and {me, i} as me. To run R map reduce streaming and load hive metadata:

    ./01runMapRed_R.sh
    ./hive -f createTableTrans.hql

   Alternately, using Python map reduce streaming::

    ./01runMapRed_py.sh
    ./hive -f createTableTrans.hql

# Analytic SQL

Using Impala through the Hadoop User Experience (HUE) application, we can quickly interact through interesting queries. Using impala, these queries can run fast enough that the user can run queries as ad-hoc and await results. We can see using the HUE simple graph functionality that there might be a trend:
![HUE](http://github.mtv.cloudera.com/barker/pres/raw/master/snapshot_hue.png "Quick Analysis in HUE")

# 3rd Party Application


 To demonstrate the data is readily available for 3rd party applications / external use, run an R script which will show the correlation of year and we/(we+me):

    ./02impAnalysis.R

![Alt text](http://github.mtv.cloudera.com/barker/pres/raw/master/snapshot_R.png "Optional title")
