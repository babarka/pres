from pyspark import SparkConf, SparkContext
conf = SparkConf()
conf.setAppName("Spark Pres Demo")
sc = SparkContext(conf = conf)

import re

dat = sc.textFile('hdfs://quickstart.cloudera:8020/user/cloudera/pres/bigdat.gz')

def parse_id(str):
    tag = 'http://millercenter.org/president/speeches/speech-'
    x = str.find(tag) + 50
    return str[x:x+4]

def parse_year(str):
    tag_start = 'amprestitle'
    tag_end = ')'
    a = str.find(tag_start)
    b = str.find(tag_end,a) - 4
    return str[b:b+4]

def parse_pres(str):
    tag_start = '<h2 style="margin: 0; padding: 0;">'
    tag_end = '</h2>'
    a = str.find(tag_start) + 35
    b = str.find(tag_end,a)
    return str[a:b]

def parse_trans(str):
    tag_start = '<div id="transcript" class="indent">'
    tag_end = '</div>'
    a = str.find(tag_start) + 34
    b = str.find(tag_end,a)
    return str[a:b]

def parse_we_me_tot(str):
    words  = re.sub("[.,?!]"," ",parse_trans(str).strip().lower()).split(" ")
    me    = len(filter(lambda x:x in ['i','me','my','mine','myself'], words))
    we    = len(filter(lambda x:x in ['we','us','our','ours','ourselves'], words))
    tot   = len(filter(None,words))
    return me,we,tot

def parse_all(x):
    measures = parse_we_me_tot(x)
    return parse_id(x) + '\t' + parse_pres(x) + '\t' + parse_year(x) + '\t' + str(measures[0]) + '\t' + str(measures[1]) + '\t' + str(measures[2])

dat.map(parse_all).saveAsTextFile("/user/cloudera/trans")

quit()

