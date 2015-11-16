
clear all; clc;

% Expectile level tau = 0.05
CARE_RB_Th1_005 = load('CARE_RB_Th1_005');
CARE_RB_Th2_005 = load('CARE_RB_Th2_005');
CARE_RB_Th3_005 = load('CARE_RB_Th3_005');

% Expectile level tau = 0.01
CARE_RB_Th1_001 = load('CARE_RB_Th1_001');
CARE_RB_Th2_001 = load('CARE_RB_Th2_001');
CARE_RB_Th3_001 = load('CARE_RB_Th3_001');

CARE_RB = [CARE_RB_Th1_005, CARE_RB_Th2_005, CARE_RB_Th3_005, ...
           CARE_RB_Th1_001, CARE_RB_Th2_001, CARE_RB_Th3_001];
save('CARE_RB', 'CARE_RB', '-ascii');

% Print Table 3
Table3 = CARE_RB;
[N, M] = size(Table3);

for i = 1 : N
    fprintf('%6.2f  & ', Table3(i, 1 : M - 1)); 
    fprintf('%6.2f  ', Table3(i, M));     
    fprintf(' \\\\ \n');
end


