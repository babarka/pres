#!/usr/bin/Rscript
# (c) 2015 copyright brad barker - sample code not supported
# all rights reserved may not be copied or published without permission

input <- file("stdin", "r")

id   <- ''
yr   <- ''
pres <- ''
me   <- 0
we   <- 0
tot  <- 0

while(length(line <- readLines(input, n=1, warn=FALSE)) > 0) {
    fields <- unlist(strsplit(line,'\t'))    
    if (id==fields[1]){
       me   <- me  + as.numeric(fields[4])
       we   <- we  + as.numeric(fields[5])
       tot  <- tot + as.numeric(fields[6]) 
    } else {
       if (id!='') {cat(paste(id,yr,pres,me,we,tot,sep="\t"))
                    cat('\n')}
       id   <- fields[1]
       pres <- fields[2]
       yr   <- fields[3]
       me   <- as.numeric(fields[4])
       we   <- as.numeric(fields[5])
       tot  <- as.numeric(fields[6])
    }
}
cat(paste(id,yr,pres,me,we,tot,sep="\t"))
cat('\n')
close(input)
 
