
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **LCARE_Test_Statistics_Th2_005** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)


```yaml

Name of Quantlet: LCARE_Test_Statistics_Th2_005

Published in: LCARE

Description: 'Evaluates the likelihood ratio test statistics for
parameter constellation theta2 and expectile leve tau = 0.05.'

Keywords:
- estimation
- time-series
- process
- data
- basis
- model   
- risk
- parameter
- likelihood ration
- likelihood
- integration

See also: 
- LCARE_Test_Statistics_Th1_005
- LCARE_Test_Statistics_Th1_001
- LCARE_Test_Statistics_Th3_005
- LCARE_Test_Statistics_Th2_001
- LCARE_Test_Statistics_Th3_001

Author: Andrija Mihoci, Xiu Xu

Submitted:  Fri, November 13 2015 by Xiu Xu

Subfunction:
- LCARE_Test_Statistics_LR
- LCARE_Estimation_Loglik
- LCARE_Loglik

Datafile : 
- CARE_Intervals
- y_t_005_Th2

Output:
- T_k_Th2_005

```




```R

 
clear all; clc;
 
y_t_005_Th2  = load('y_t_005_Th2');  
n_t_005_Th2  = size(y_t_005_Th2, 2);
tau          = 0.05;
A_t_005_Th2  = (1 : 1 : n_t_005_Th2)';
LI_t_005_Th2 =  arrayfun(@(x) LCARE_Test_Statistics_LR(y_t_005_Th2(:, x), ...
                tau), A_t_005_Th2, 'UniformOutput', false);
LR_t_005_Th2 = reshape(cell2mat(LI_t_005_Th2), [], n_t_005_Th2);
L_A_Th2_005  = LR_t_005_Th2(1 : 166, :);
L_B_Th2_005  = LR_t_005_Th2(167 : 332, :);
L_I_Th2_005  = LR_t_005_Th2(333 : 498, :);
L_LR_Th2_005 = LR_t_005_Th2(499 : end, :);
 
CARE_Intervals    = load('CARE_Intervals');
T_n_k             = CARE_Intervals(2 : 1 : 11, 2) - CARE_Intervals(1, 2);
T_k_Th2_005       = zeros(10, 1000);
T_k_Th2_005(1, :) = max(L_LR_Th2_005(1 : T_n_k(1), :));
 
for j = 2 : 1 : length(T_n_k)    
    T_k_Th2_005(j, :) = max(L_LR_Th2_005((T_n_k(j - 1) + 1) : 1 : T_n_k(j), :));  
end
 
save('T_k_Th2_005', 'T_k_Th2_005', '-ascii');
 

