% ---------------------------------------------------------------------
% Project:      LCARE
% ---------------------------------------------------------------------
% Quantlet:     LCARE_Risk_Bound_Th2_005
% ---------------------------------------------------------------------
% Description:  Simulates the risk bound of a CARE model according to 
%               theta2 parameter constellation at expectile level 
%               tau = 0.01
% ---------------------------------------------------------------------
% Keywords:     estimation, time-series, process, data, basis, model, 
%               risk, parameter
% ---------------------------------------------------------------------
% Author:       Andrija Mihoci, Xiu Xu 20150219
% ---------------------------------------------------------------------

clear all; clc;

% Input
n_0     = 20;                                
c       = 1.25;                                
K       = 11;                                  
n_K     = 250;                               
Th2_005 = [-0.00998, -0.05234, -0.85700, 0.56274, 0.00005]';
Theta   = Th2_005;
c_r     = 0.50; 
d_r     = 1.00;                  
rho     = 0.25;                             
tau     = 0.01;

CARE_yv        = load('y_t_005_Th2');           
CARE_Intervals = load('CARE_Intervals');
V              = size(CARE_yv, 2);

% Programme Code
Lk_Thk = zeros(K - 1, V, K - 1); 
Lk_Th  = zeros(K - 1, V, K - 1); 
Lk_Thl = zeros(K - 1, V, K - 1);
for v = 1 : 1 : V
  for j = 1 : 1 : K - 1
    for k = j : 1 : K - 1
        Lk_Thk(k, v, j) = LCARE_Estimation_Loglik(CARE_yv(CARE_Intervals(k + 1, 7) : end, v), tau);
        Lk_Th(k, v, j)  = LCARE_Loglik(CARE_yv(CARE_Intervals(k + 1, 7) : end, v), tau, Theta);
        Lk_Thl(k, v, j) = LCARE_Loglik(CARE_yv(CARE_Intervals(k + 1, 7) : end, v), tau, ...
                          LCARE_Estimation_Theta(CARE_yv(CARE_Intervals(j, 7) : end, v), tau));
    end
  end
end

RB                = [max(mean(abs(Lk_Thk(:, :, 1) - Lk_Th(:, :, 1)) .^ c_r, 2));
                    max(mean(abs(Lk_Thk(:, :, 1) - Lk_Th(:, :, 1)) .^ d_r, 2))];
CARE_RB_Th2_005   = rho * RB ./ [K - 1, K - 1]';
CARE_LR_c_Th2_005 = abs(Lk_Thk - Lk_Thl) .^ c_r;
CARE_LR_d_Th2_005 = abs(Lk_Thk - Lk_Thl) .^ d_r;

% Output
Out.Lk_Thk = Lk_Thk; 
Out.Lk_Th  = Lk_Th; 
Out.Lk_Thl = Lk_Thl;
save('CARE_RB_Th2_005', 'CARE_RB_Th2_005', '-ascii');
save('CARE_risk_bound_Th2_005.mat');

