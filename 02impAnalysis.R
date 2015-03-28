#!/usr/bin/Rscript
# (c) 2015 copyright brad barker - sample code not supported
# all rights reserved may not be copied or published without permission


# TODO: call through jdbc oppposed to cli
dat <- read.table(pipe("impala-shell -Bf impAnalysis.hql --print_header --quiet 2> /dev/null | sed '1,2d'"),
                  sep='\t',header=TRUE)

# lets evaluate the univariate model team
lm <- lm (team_index ~ dte, data=dat)
summary(lm)

# lets plot the model so that we can share our analytics
plot(dat$dte, dat$team_index)
abline(lm, col='blue')


