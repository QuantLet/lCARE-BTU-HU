
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **LCARE_Critical_Values_Th2_005** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet : LCARE_Critical_Values_Th2_005

Published in : LCARE

Description : 'Evaluates the critical values based on the likelihood ration and risk bound at
parameter constellation theta2 and expectile leve tau = 0.05'

Keywords : 'estimation, time-series, process, data, basis, model, risk, parameter, likelihood
ratio, likelihood, parametric, threshold'

See also : 'LCARE_Critical_Values_Th1_001, LCARE_Critical_Values_Th1_005,
LCARE_Critical_Values_Th2_001, LCARE_Critical_Values_Th3_001, LCARE_Critical_Values_Th3_005'

Author : Andrija Mihoci, Xiu Xu

Submitted : Sat, November 14 2015 by Xiu Xu

Subfunction : LCARE_Propagation_Condition

Datafile : CARE_RB_Th2_005, y_t_005_Th2, T_k_Th2_005, CARE_risk_bound_Th2_005.mat

Output : z_k_Th2_005

```


### MATLAB Code:
```matlab

clear all; clc;

% Input
K                       = 11;                                     
rho                     = 0.25;                                 
CARE_RB_Th2_005         = load('CARE_RB_Th2_005'); 
T_k_Th2_005             = load('T_k_Th2_005');          
y_t_005_Th2             = load('y_t_005_Th2');
V                       = size(y_t_005_Th2, 2);
CARE_risk_bound_Th2_005 = load('CARE_risk_bound_Th2_005.mat');
CARE_LR_c_Th2_005       = CARE_risk_bound_Th2_005.CARE_LR_c_Th2_005;
CARE_LR_d_Th2_005       = CARE_risk_bound_Th2_005.CARE_LR_d_Th2_005;

% Programme Code
z_k_c_Th2_005 = zeros(K - 1, K - 1); 
z_k_d_Th2_005 = zeros(K - 1, K - 1);
for s = 1 : 1 : (K - 1)
  for s_step = 1 : 1 : K - 1
      
      z_k_c_Th2_005(s, s_step) = LCARE_Propagation_Condition(s, s_step, ...
                                  V, T_k_Th2_005, CARE_LR_c_Th2_005, 1)...
                                 + CARE_RB_Th2_005(1);
      z_k_d_Th2_005(s, s_step) = LCARE_Propagation_Condition(s, s_step, ...
                                  V, T_k_Th2_005, CARE_LR_d_Th2_005, 2)...
                                 + CARE_RB_Th2_005(2);
                             
  end
end
z_k_c_Th2_005 = diag(z_k_c_Th2_005); 
z_k_d_Th2_005 = diag(z_k_d_Th2_005);
z_k_Th2_005   = [z_k_c_Th2_005, z_k_d_Th2_005];

for i = 1 : 1 : 2
  for s = 2 : 1 : length(z_k_Th2_005)
      
    if z_k_Th2_005(s, i) > z_k_Th2_005(s - 1, i)
        z_k_Th2_005(s, i) = z_k_Th2_005(s - 1, i);
    else
        z_k_Th2_005(s, i) = z_k_Th2_005(s, i);
    end
    
  end
end

% Output
Out.z_k_Th2_005 = z_k_Th2_005;
save('z_k_Th2_005', 'z_k_Th2_005', '-ascii');


```
