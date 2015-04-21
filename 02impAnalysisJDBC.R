# install.packages("RJDBC",dep=TRUE)
library(RJDBC)
drv <- JDBC("org.apache.hive.jdbc.HiveDriver", 
            "/Users/barker/Downloads/impala-jdbc-0.5-2/impala-jdbc-0.0.1.jar","'")
conn <- dbConnect(drv, "jdbc:hive2://impalad:21050/;auth=noSasl")
sql <- "SELECT pres,yr,SUM(we)/SUM(we+me) weme_index
        FROM default.trans
        WHERE me > 0 AND we > 0
        GROUP BY pres, yr"
dat <- dbGetQuery(conn, sql)
lm <- lm(weme_index~yr, data=dat)
summary(lm)
plot(dat$yr, dat$weme_index,
     main="Presidential Democratization:\n Inaugural Speech Year by WEME-Index",
     pch=19, xlab="Inaugural Speech Year", ylab="WEME-Index")
abline(lm, col='blue')