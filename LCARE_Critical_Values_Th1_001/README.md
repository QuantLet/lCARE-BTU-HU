
[<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/banner.png" width="888" alt="Visit QuantNet">](http://quantlet.de/)

## [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **LCARE_Critical_Values_Th1_001** [<img src="https://github.com/QuantLet/Styleguide-and-FAQ/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/)

```yaml

Name of Quantlet : LCARE_Critical_Values_Th1_001

Published in : LCARE

Description : 'Evaluates the critical values based on the likelihood ration and risk bound at
parameter constellation theta1 and expectile leve tau = 0.01'

Keywords : 'estimation, time-series, process, data, basis, model, risk, parameter, likelihood
ratio, likelihood, parametric, threshold'

See also : 'LCARE_Critical_Values_Th3_001, LCARE_Critical_Values_Th1_005,
LCARE_Critical_Values_Th2_001, LCARE_Critical_Values_Th2_005, LCARE_Critical_Values_Th3_005'

Author : Andrija Mihoci, Xiu Xu

Submitted : Fri, November 13 2015 by Xiu Xu

Subfunction : LCARE_Propagation_Condition

Datafile : CARE_RB_Th1_001, y_t_001_Th1, T_k_Th1_001, CARE_risk_bound_Th1_001.mat

Output : z_k_Th1_001

```


### MATLAB Code:
```matlab

clear all; clc;

% Input
K                       = 11;                                     
rho                     = 0.25;                                 
CARE_RB_Th1_001         = load('CARE_RB_Th1_001'); 
T_k_Th1_001             = load('T_k_Th1_001');          
y_t_001_Th1             = load('y_t_001_Th1');
V                       = size(y_t_001_Th1, 2);
CARE_risk_bound_Th1_001 = load('CARE_risk_bound_Th1_001.mat');
CARE_LR_c_Th1_001       = CARE_risk_bound_Th1_001.CARE_LR_c_Th1_001;
CARE_LR_d_Th1_001       = CARE_risk_bound_Th1_001.CARE_LR_d_Th1_001;

% Programme Code
z_k_c_Th1_001 = zeros(K - 1, K - 1); 
z_k_d_Th1_001 = zeros(K - 1, K - 1);
for s = 1 : 1 : (K - 1)
  for s_step = 1 : 1 : K - 1
      
      z_k_c_Th1_001(s, s_step) = LCARE_Propagation_Condition(s, s_step, ...
                                 V, T_k_Th1_001, CARE_LR_c_Th1_001, CARE_RB_Th1_001(1))...
                                 + CARE_RB_Th1_001(1);
      z_k_d_Th1_001(s, s_step) = LCARE_Propagation_Condition(s, s_step, ...
                                 V, T_k_Th1_001, CARE_LR_d_Th1_001, CARE_RB_Th1_001(2))...
                                 + CARE_RB_Th1_001(2);
                             
  end
end
z_k_c_Th1_001 = diag(z_k_c_Th1_001); 
z_k_d_Th1_001 = diag(z_k_d_Th1_001);
z_k_Th1_001   = [z_k_c_Th1_001, z_k_d_Th1_001];

for i = 1 : 1 : 2
  for s = 2 : 1 : length(z_k_Th1_001)
      
    if z_k_Th1_001(s, i) > z_k_Th1_001(s - 1, i)
        z_k_Th1_001(s, i) = z_k_Th1_001(s - 1, i);
    else
        z_k_Th1_001(s, i) = z_k_Th1_001(s, i);
    end
    
  end
end

% Output
Out.z_k_Th1_001 = z_k_Th1_001;
save('z_k_Th1_001', 'z_k_Th1_001', '-ascii');


```
