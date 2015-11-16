
clear all; clc;

% Input
K                       = 11;                                     
rho                     = 0.25;                                 
CARE_RB_Th3_001         = load('CARE_RB_Th3_001'); 
T_k_Th3_001             = load('T_k_Th3_001');          
y_t_001_Th3             = load('y_t_001_Th3');
V                       = size(y_t_001_Th3, 2);
CARE_risk_bound_Th3_001 = load('CARE_risk_bound_Th3_001.mat');
CARE_LR_c_Th3_001       = CARE_risk_bound_Th3_001.CARE_LR_c_Th3_001;
CARE_LR_d_Th3_001       = CARE_risk_bound_Th3_001.CARE_LR_d_Th3_001;

% Programme Code
z_k_c_Th3_001 = zeros(K - 1, K - 1); 
z_k_d_Th3_001 = zeros(K - 1, K - 1);
for s = 1 : 1 : (K - 1)
  for s_step = 1 : 1 : K - 1
      
      z_k_c_Th3_001(s, s_step) = LCARE_Propagation_Condition(s, s_step, ...
                                  V, T_k_Th3_001, CARE_LR_c_Th3_001, 1)...
                                 + CARE_RB_Th3_001(1);
      z_k_d_Th3_001(s, s_step) = LCARE_Propagation_Condition(s, s_step, ...
                                  V, T_k_Th3_001, CARE_LR_d_Th3_001, 2)...
                                 + CARE_RB_Th3_001(2);
                             
  end
end
z_k_c_Th3_001 = diag(z_k_c_Th3_001); 
z_k_d_Th3_001 = diag(z_k_d_Th3_001);
z_k_Th3_001   = [z_k_c_Th3_001, z_k_d_Th3_001];

for i = 1 : 1 : 2
  for s = 2 : 1 : length(z_k_Th3_001)
      
    if z_k_Th3_001(s, i) > z_k_Th3_001(s - 1, i)
        z_k_Th3_001(s, i) = z_k_Th3_001(s - 1, i);
    else
        z_k_Th3_001(s, i) = z_k_Th3_001(s, i);
    end
    
  end
end

% Output
Out.z_k_Th3_001 = z_k_Th3_001;
save('z_k_Th3_001', 'z_k_Th3_001', '-ascii');

