#!/usr/bin/env python

from operator import itemgetter
import sys

current_id = 'init'
me_cnt     = 0
we_cnt     = 0
tot_cnt    = 0

# input comes from STDIN
for line in sys.stdin:
    # parse the input we got from mapper.py
    id,yr,pres,me,we,tot = line[:-1].split('\t')
    if current_id == id:
        me_cnt  += int(me)
        we_cnt  += int(we)
        tot_cnt += int(tot)
    else:
        print '%s\t%s\t%s\t%s\t%s\t%s' % (id,pres,yr,me_cnt,we_cnt,tot_cnt)
        me_cnt     = int(me)
        we_cnt     = int(we)
        tot_cnt    = int(tot)
        current_id = id
# do not forget to output the last id if needed
if current_id == id:
    print '%s\t%s\t%s\t%s\t%s\t%s' % (id,pres,yr,me_cnt,we_cnt,tot_cnt)
