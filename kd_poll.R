
library(data.table)

kd_poll <- fread(input = 'https://www.kdnuggets.com/aps/sw17-top11-dl-sh.anon.csv')

kd_poll <- kd_poll[!(Python == 0 & `R language` == 0), ]

kd_poll[, r_and_py := +(rowSums(.SD) == 2),
        .SDcols = c("Python", "R language")]

kd_poll_m <- melt(kd_poll[, c("N", "Python", "R language", "r_and_py")],
                  id.vars = "N")

kd_poll_m[, sum(value), by = "variable"]

