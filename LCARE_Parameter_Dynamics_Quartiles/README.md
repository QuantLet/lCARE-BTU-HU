
![http://quantnet.wiwi.hu-berlin.de/style/banner.png](http://quantnet.wiwi.hu-berlin.de/style/banner.png)

## ![qlogo](http://quantnet.wiwi.hu-berlin.de/graphics/quantlogo.png) **LCARE_Parameter_Dynamics_Quartiles**


```yaml

Name of QuantLet : LCARE_Parameter_Dynamics_Quartiles

Published in : LCARE

Description : 'Pool the estimated parameters together based on
CARE model, and show the descriptive statistics  first quartile
(25% quantile), mean value, third quartile (75% quantile)).'

Keywords:
- risk management
- estimation
- parameter
- quantile
- mean

See also: 
- LCARE_Estimation_Rolling_001
- LCARE_Estimation_Rolling_005

Author: Andrija Mihoci, Xiu Xu

Submitted: Thu, November 12 2015 by Xiu Xu

Datafile: 
- tau_005.mat
- tau_001.mat

```



```R


 
clear all; clc;
 
load('tau_005');
paras_ALL_005      = [paras_DAX; paras_FTSE; paras_SP];
CARE_quartiles_5   = [quantile(paras_ALL_005, 0.25)', mean(paras_ALL_005)', ...
                      quantile(paras_ALL_005, 0.75)'];
CARE_quartiles_005 = CARE_quartiles_5(16 : end, :);
save('CARE_quartiles_005', 'CARE_quartiles_005', '-ascii');
 
clearvars -except CARE_quartiles_005; clc;
load('tau_001');
paras_ALL_001      = [paras_DAX; paras_FTSE; paras_SP];
CARE_quartiles_1   = [quantile(paras_ALL_001, 0.25)', mean(paras_ALL_001)', ...
                      quantile(paras_ALL_001, 0.75)'];
CARE_quartiles_001 = CARE_quartiles_1(16 : end, :);
save('CARE_quartiles_001', 'CARE_quartiles_001', '-ascii');
 
% Print Table 2
Table2 = [CARE_quartiles_005 CARE_quartiles_001];
[N, M] = size(Table2);
 
for i = 1 : N
    fprintf('%10.5f  & ', Table2(i, 1 : M - 1)); 
    fprintf('%10.5f  ', Table2(i, M));     
    fprintf(' \\\\ \n');
end



```
