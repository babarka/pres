#!/usr/bin/env python

import sys

current_id = 'init'
me_cnt     = 0
we_cnt     = 0
tot_cnt    = 0

# input comes from STDIN
for line in sys.stdin:
    # parse the input we got from mapper.py
    fields = line[:-1].split('\t')
    if (current_id == fields[0]):
        me,we,tot = fields[3:]
        me_cnt  += int(me)
        we_cnt  += int(we)
        tot_cnt += int(tot)
    else:
        if (current_id!='init'):
            print '%s\t%s\t%s\t%s\t%s\t%s' % (id,pres,yr,me_cnt,we_cnt,tot_cnt)
        id,yr,pres,me,we,tot = fields
        me_cnt     = int(me)
        we_cnt     = int(we)
        tot_cnt    = int(tot)
        current_id = id
# do not forget to output the last id if needed
if current_id != 'init':
    print '%s\t%s\t%s\t%s\t%s\t%s' % (id,pres,yr,me_cnt,we_cnt,tot_cnt)
