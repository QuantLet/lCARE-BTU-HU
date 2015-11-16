
clear all; clc;

y_t_001_Th3  = load('y_t_001_Th3');  
n_t_001_Th3  = size(y_t_001_Th3, 2);
tau          = 0.01;
A_t_001_Th3  = (1 : 1 : n_t_001_Th3)';
LI_t_001_Th3 =  arrayfun(@(x) LCARE_Test_Statistics_LR(y_t_001_Th3(:, x), ...
                tau), A_t_001_Th3, 'UniformOutput', false);
LR_t_001_Th3 = reshape(cell2mat(LI_t_001_Th3), [], n_t_001_Th3);
L_A_Th3_001  = LR_t_001_Th3(1 : 166, :);
L_B_Th3_001  = LR_t_001_Th3(167 : 332, :);
L_I_Th3_001  = LR_t_001_Th3(333 : 498, :);
L_LR_Th3_001 = LR_t_001_Th3(499 : end, :);

CARE_Intervals    = load('CARE_Intervals');
T_n_k             = CARE_Intervals(2 : 1 : 11, 2) - CARE_Intervals(1, 2);
T_k_Th3_001       = zeros(10, 1000);
T_k_Th3_001(1, :) = max(L_LR_Th3_001(1 : T_n_k(1), :));

for j = 2 : 1 : length(T_n_k)    
    T_k_Th3_001(j, :) = max(L_LR_Th3_001((T_n_k(j - 1) + 1) : 1 : T_n_k(j), :));  
end

save('T_k_Th3_001', 'T_k_Th3_001', '-ascii');

