#!/usr/bin/env python

import sys, re
inTranscript = False
# input comes from STDIN (standard input)
for line in sys.stdin:
    # find id
    if "http://millercenter.org/president/speeches/speech-" in line: id = line[110:114]
    # Find Inaugural Address Year
    if "amprestitle" in line: yr = re.search('[0-9]{4}',line).group(0) 
    # find president
    if '<h2 style="margin: 0; padding: 0;">' in line:
       pres = re.sub('</h2>','',re.sub('<h2 style="margin: 0; padding: 0;">','',line))[:-1]
    # find transcript end
    if '</div>' in line: inTranscript = False
    # write word counts if in transcript
    if inTranscript:
       line  = re.sub("[.,?!]"," ",line.strip().lower())
       words = line.split()
       me    = len(filter(lambda x:x in ['i','me'], words))
       #me    = len(filter(lambda x:x in ['i','me','my','mine','myself'], words))
       we    = len(filter(lambda x:x in ['we','us'], words))
       #we    = len(filter(lambda x:x in ['we','us','our','ours','ourselves'], words))
       tot   = len(words)
       print '%s\t%s\t%s\t%s\t%s\t%s' % (id,yr,pres,me,we,tot)
    # find transcript start
    if '<div id="transcript" class="indent">' in line: inTranscript = True   
