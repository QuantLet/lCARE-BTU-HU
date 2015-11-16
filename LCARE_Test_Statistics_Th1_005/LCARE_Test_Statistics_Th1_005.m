
clear all; clc;

y_t_005_Th1  = load('y_t_005_Th1');  
n_t_005_Th1  = size(y_t_005_Th1, 2);
tau          = 0.05;
A_t_005_Th1  = (1 : 1 : n_t_005_Th1)';
LI_t_005_Th1 = arrayfun(@(x) LCARE_Test_Statistics_LR(y_t_005_Th1(:, x), ...
               tau), A_t_005_Th1, 'UniformOutput', false);
LR_t_005_Th1 = reshape(cell2mat(LI_t_005_Th1), [], n_t_005_Th1);
L_A_Th1_005  = LR_t_005_Th1(1 : 166, :);
L_B_Th1_005  = LR_t_005_Th1(167 : 332, :);
L_I_Th1_005  = LR_t_005_Th1(333 : 498, :);
L_LR_Th1_005 = LR_t_005_Th1(499 : end, :);

CARE_Intervals    = load('CARE_Intervals');
T_n_k             = CARE_Intervals(2 : 1 : 11, 2) - CARE_Intervals(1, 2);
T_k_Th1_005       = zeros(10, 1000);
T_k_Th1_005(1, :) = max(L_LR_Th1_005(1 : T_n_k(1), :));

for j = 2 : 1 : length(T_n_k)    
    T_k_Th1_005(j, :) = max(L_LR_Th1_005((T_n_k(j - 1) + 1) : 1 : T_n_k(j), :));  
end

save('T_k_Th1_005', 'T_k_Th1_005', '-ascii');

