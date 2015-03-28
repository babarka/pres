#!/usr/bin/Rscript
# (c) 2015 copyright brad barker - sample code not supported
# all rights reserved may not be copied or published without permission

input <- file("stdin", "r")

inTranscript <- FALSE

while(length(line <- readLines(input, n=1, warn=FALSE)) > 0) {
   # find id
   if (grepl('http://millercenter.org/president/speeches/speech-', line)) {
      id <- substr(line, 111, 114)
   }
   
   # find president
   if (grepl('<h2 style="margin: 0; padding: 0;">', line)) {
       pres <- gsub('<h2 style="margin: 0; padding: 0;">','',line)
       pres <- gsub('</h2>','',pres)
   }     
   # find transcript start
   if (grepl('<div id="transcript" class="indent">', line)) inTranscript <- TRUE   
   # write word counts if in transcript
   if (inTranscript) {
      line  <- tolower(gsub("[.,?!;]"," ",line))
      words <- unlist(strsplit(line, " "))
      me    <- length(grep("^me$|^i$",words))
      we    <- length(grep("^we$|^us$",words))
      tot   <- length(words)
      cat(paste(id,pres,me,we,tot,sep='\t'))
      cat('\n')
   }
   # find transcript end
   if (grepl('</div>', line)) inTranscript <- FALSE
}

close(input)

