
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **LCARE_a_rsn** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)


```yaml

Name of Quantlet: LCARE_a_rsn

Published in: LCARE

Description: 'Simulates the time series data following asymmetric normal 
distributions (AND), the simulated datasets are saved as txt and dat files.'

Keywords:
- simulation
- time-series
- process
- data
- model 
- asymmetric

See also: 
- LCARE_c_Simulation 

Author: Andrija Mihoci, Xiu Xu

Submitted:  Wed, November 11 2015 by Xiu Xu
```




```r

# clear history
rm(list = ls(all = TRUE))
graphics.off()

# install and load packages
libraries = c("sn")
lapply(libraries, function(x) if (!(x %in% installed.packages())) {
install.packages(x)
})
lapply(libraries, library, quietly = TRUE, character.only = TRUE)

# define matrix and save as datasets
V      = 1000
er_005 = matrix(0, 250, V)
for (i in 1:V) {
er_005[, i] = as.matrix(rsn(n = 250, xi = 0, omega = sqrt(5e-05), alpha = 2))
}
write.table(er_005, "er_005.dat", row.names = F, col.names = F)
write.table(er_005, "er_005.txt", row.names = F, col.names = F)

er_001 = matrix(0, 250, V)
for (i in 1:V) {
er_001[, i] = as.matrix(rsn(n = 250, xi = 0, omega = sqrt(4e-04), alpha = 4))
}
write.table(er_001, "er_001.dat", row.names = F, col.names = F)
write.table(er_001, "er_001.txt", row.names = F, col.names = F)

```