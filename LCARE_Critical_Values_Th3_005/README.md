
![http://quantnet.wiwi.hu-berlin.de/style/banner.png](http://quantnet.wiwi.hu-berlin.de/style/banner.png)

## ![qlogo](http://quantnet.wiwi.hu-berlin.de/graphics/quantlogo.png) **LCARE_Test_Statistics_Th3_005**


```yaml

Name of Quantlet: LCARE_Test_Statistics_Th3_005

Published in: LCARE

Description: 'Evaluates the likelihood ratio test statistics for
parameter constellation theta3 and expectile leve tau = 0.05.'

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
- LCARE_Critical_Values_Th1_001
- LCARE_Critical_Values_Th1_005
- LCARE_Critical_Values_Th2_001
- LCARE_Critical_Values_Th2_005
- LCARE_Critical_Values_Th3_001 

Author: Andrija Mihoci, Xiu Xu

Submitted:  Sat, November 14 2015 by Xiu Xu

Subfunction:
- LCARE_Propagation_Condition

Datafile : 
- CARE_RB_Th3_005
- y_t_005_Th3
- T_k_Th3_005
- CARE_risk_bound_Th3_005.mat

Output:
- z_k_Th3_005

```




```R



 
clear all; clc;
 
% Input
K                       = 11;                                     
rho                     = 0.25;                                 
CARE_RB_Th3_005         = load('CARE_RB_Th3_005'); 
T_k_Th3_005             = load('T_k_Th3_005');          
y_t_005_Th3             = load('y_t_005_Th3');
V                       = size(y_t_005_Th3, 2);
CARE_risk_bound_Th3_005 = load('CARE_risk_bound_Th3_005.mat');
CARE_LR_c_Th3_005       = CARE_risk_bound_Th3_005.CARE_LR_c_Th3_005;
CARE_LR_d_Th3_005       = CARE_risk_bound_Th3_005.CARE_LR_d_Th3_005;
 
% Programme Code
z_k_c_Th3_005 = zeros(K - 1, K - 1); 
z_k_d_Th3_005 = zeros(K - 1, K - 1);
for s = 1 : 1 : (K - 1)
  for s_step = 1 : 1 : K - 1
      
      z_k_c_Th3_005(s, s_step) = LCARE_Propagation_Condition(s, s_step, ...
                                  V, T_k_Th3_005, CARE_LR_c_Th3_005, 1)...
                                 + CARE_RB_Th3_005(1);
      z_k_d_Th3_005(s, s_step) = LCARE_Propagation_Condition(s, s_step, ...
                                  V, T_k_Th3_005, CARE_LR_d_Th3_005, 2)...
                                 + CARE_RB_Th3_005(2);
                             
  end
end
z_k_c_Th3_005 = diag(z_k_c_Th3_005); 
z_k_d_Th3_005 = diag(z_k_d_Th3_005);
z_k_Th3_005   = [z_k_c_Th3_005, z_k_d_Th3_005];
 
for i = 1 : 1 : 2
  for s = 2 : 1 : length(z_k_Th3_005)
      
    if z_k_Th3_005(s, i) > z_k_Th3_005(s - 1, i)
        z_k_Th3_005(s, i) = z_k_Th3_005(s - 1, i);
    else
        z_k_Th3_005(s, i) = z_k_Th3_005(s, i);
    end
    
  end
end
 
% Output
Out.z_k_Th3_005 = z_k_Th3_005;
save('z_k_Th3_005', 'z_k_Th3_005', '-ascii');
 

