
![http://quantnet.wiwi.hu-berlin.de/style/banner.png](http://quantnet.wiwi.hu-berlin.de/style/banner.png)

## ![qlogo](http://quantnet.wiwi.hu-berlin.de/graphics/quantlogo.png) **LCARE_a_rsn**


```yaml

Name of Quantlet: LCARE_a_rsn

Published in: LCARE

Description: Simulates the data time series following AND.

Keywords:
- simulation
- time-series
- process
- data
- model   
- asymmetric

See also: 
- LCARE_b_Simulation 

Author: Andrija Mihoci, Xiu Xu

Submitted:  Wen, November 11 2015 by Xiu Xu
```




```R

 

# clear history
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("sn")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
  install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# define matrix
V      = 1000
er_005 = matrix(0, 250, V)
for (i in 1 : V){
er_005[, i] = as.matrix(rsn(n = 250, xi = 0, omega = sqrt(0.00005), alpha = 2.00))
}
write.table(er_005, "er_005.dat", row.names = F, col.names = F)
write.table(er_005, "er_005.txt", row.names = F, col.names = F)

er_001 = matrix(0, 250, V)
for (i in 1 : V){
er_001[, i] = as.matrix(rsn(n = 250, xi = 0, omega = sqrt(0.00040), alpha = 4.00))
}
write.table(er_001, "er_001.dat", row.names = F, col.names = F)
write.table(er_001, "er_001.txt", row.names = F, col.names = F)
 