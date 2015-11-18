
function [lcare_k, et_k, yt_k] = LCARE_Test_Statistics_k_hat_Nms(y, tau, z)

% 1. select 2 critical value vectors from 6 groups (3 parameters * 2 risk power)
Th0  = LCARE_Estimation_Theta(y, tau);
z_cd = zeros(size(z, 1), 2);

if tau == 0.05    
    a1      = [ -0.01034, 0.05234, 0.12149 ]';
    a1_z    = [mean(a1(1 : 2, :)), mean(a1(2 : 3, :))]'; 
    a1_true = Th0(2);
    
    if a1_true <= a1_z(1)
        z_cd     = z(: , 1 : 2);
        flag_crv = 1; 
        flag_a1  = a1(1); 
    elseif a1_true <= a1_z(2)
        z_cd     = z(: , 3 : 4); 
        flag_crv = 2; 
        flag_a1  = a1(2); 
    else 
        z_cd     = z(: , 5 : 6); 
        flag_crv = 3; 
        flag_a1  = a1(3); 
    end
    
elseif tau == 0.01
    a1      = [ -0.00298, 0.10132, 0.12637 ]';
    a1_z    = [mean(a1(1 : 2, :)), mean(a1(2 : 3, :))]'; 
    a1_true = Th0(2); 
    
    if a1_true <= a1_z(1)
        z_cd     = z(: , 7 : 8);   
        flag_crv = 1; 
        flag_a1  = a1(1); 
    elseif a1_true <= a1_z(2)
        z_cd     = z(: , 9 : 10); 
        flag_crv = 2;
        flag_a1  = a1(2); 
    else 
        z_cd     = z(: , 11 : 12); 
        flag_crv = 3; 
        flag_a1  = a1(3); 
    end
    
end

% 2. choose the maximium available interval based on the choosed criticals
CARE_Intervals = load('CARE_Intervals');
K              = size(z_cd, 1) + 1;
k              = 1;
LR             = 1; 
critical       = 1000; 
L_T            = 1000 * ones(size(z_cd, 1), 1);

while ( LR <= critical && k < K)
    J_k       = (CARE_Intervals(k + 1, 4) : - 1 : CARE_Intervals(k + 1, 3))';
    L_A_k     = arrayfun(@(x) LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5) : 1 : x, 1), tau), J_k);
    J_k1      = J_k + 1; 
    L_B_k     = arrayfun(@(x) LCARE_Estimation_Loglik(y(x : 1 : CARE_Intervals(1, 10), 1), tau), J_k1);
    L_I_k     = LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5) : 1 : CARE_Intervals(1, 10), 1), tau) ...
                * ones(length(J_k), 1); 
    L_T_k0    = L_A_k + L_B_k - L_I_k;
    LR        = max(L_T_k0);
    L_T(k, :) = LR; 
    critical  = max(z_cd(k, :));
    k         = k + 1;
end

% 3. select the adaptive interval
LT_lag = L_T * ones(1, size(z_cd, 2)) - z_cd; 

if (max(LT_lag(: , 1) >= 0)) > 0    
    k_hat_c = find((LT_lag(: , 1) >= 0), 1, 'first');  
else
    k_hat_c = size(z_cd, 1);
end
if (max(LT_lag(: ,2) >= 0)) > 0    
    k_hat_d = find((LT_lag(: , 2) >= 0), 1, 'first');  
else
    k_hat_d = size(z_cd, 1);
end

k_hat     = [k_hat_c, k_hat_d];
n_k_hat_c = CARE_Intervals(k_hat_c, 2);
n_k_hat_d = CARE_Intervals(k_hat_d, 2);
n_k_hat   = [n_k_hat_c, n_k_hat_d];
c_r       = 0.50; 
d_r       = 1.00;         
r_k       = [c_r, d_r];

% 4. get the estimated theta
y_k_esti_c    = y(CARE_Intervals(k_hat_c, 6) : 1 : CARE_Intervals(1, 10), 1);
y_k_esti_d    = y(CARE_Intervals(k_hat_d, 6) : 1 : CARE_Intervals(1, 10), 1);
Theta_k_hat_c = LCARE_Estimation(y_k_esti_c, tau); 
Theta_k_hat_d = LCARE_Estimation(y_k_esti_d, tau); 
Theta_k_hat   = [Theta_k_hat_c, Theta_k_hat_c];

% 5. estimated t+1 expectile
y_k_lag_c      = y_k_esti_c(end - 1 : end, :);
y_k_lag_plus_c = (y_k_lag_c .* (y_k_lag_c > 0)) .^ 2;
y_k_lag_neg_c  = (y_k_lag_c .* (y_k_lag_c < 0)) .^ 2;
y_k_lag_d      = y_k_esti_d(end - 1: end, :);
y_k_lag_plus_d = (y_k_lag_d .* (y_k_lag_d > 0)) .^ 2;
y_k_lag_neg_d  = (y_k_lag_d .* (y_k_lag_d < 0)) .^ 2;
e_est_k        = zeros(size(y_k_lag_c, 1), 2);  
e_est_k(: , 1) = Theta_k_hat_c(1) + Theta_k_hat_c(2) * y_k_lag_c + ...
                 Theta_k_hat_c(3) * y_k_lag_plus_c + Theta_k_hat_c(4) * y_k_lag_neg_c; 
e_est_k(: , 2) = Theta_k_hat_d(1) + Theta_k_hat_d(2) * y_k_lag_d + ...
                 Theta_k_hat_d(3) * y_k_lag_plus_d + Theta_k_hat_d(4) * y_k_lag_neg_d; 

tauv       =[tau, tau];
L_T_k      = [L_T, L_T];
flag_crv_k = [flag_crv, flag_crv];
flag_a1_k  = [flag_a1, flag_a1];
Th0_k      = [Th0, Th0];
lcare_k    = [tauv; r_k; k_hat; n_k_hat; Theta_k_hat; L_T_k; e_est_k; flag_a1_k; flag_crv_k; Th0_k]; 

% 6. estimate expectile in whole sample (250)
y_plus    = (y .* (y > 0)) .^ 2;
y_neg     = (y .* (y < 0)) .^ 2;
et        = zeros(size(y,1), 2);   
et(: , 1) = Theta_k_hat_c(1) + Theta_k_hat_c(2) * y + Theta_k_hat_c(3) * y_plus + Theta_k_hat_c(4) * y_neg;  
et(: , 2) = Theta_k_hat_d(1) + Theta_k_hat_d(2) * y + Theta_k_hat_d(3) * y_plus + Theta_k_hat_d(4) * y_neg;  
et_k      = [tauv; r_k; et];
y2        = [y, y];
yt_k      = [tauv; r_k; y2];

end

