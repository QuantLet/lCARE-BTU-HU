
clear all; clc;

load('tau_005');
paras_ALL_005      = [paras_DAX; paras_FTSE; paras_SP];
CARE_quartiles_5   = [quantile(paras_ALL_005, 0.25)', mean(paras_ALL_005)', ...
                      quantile(paras_ALL_005, 0.75)'];
CARE_quartiles_005 = CARE_quartiles_5(16 : end, :);
save('CARE_quartiles_005', 'CARE_quartiles_005', '-ascii');

clearvars -except CARE_quartiles_005; clc;
load('tau_001');
paras_ALL_001      = [paras_DAX; paras_FTSE; paras_SP];
CARE_quartiles_1   = [quantile(paras_ALL_001, 0.25)', mean(paras_ALL_001)', ...
                      quantile(paras_ALL_001, 0.75)'];
CARE_quartiles_001 = CARE_quartiles_1(16 : end, :);
save('CARE_quartiles_001', 'CARE_quartiles_001', '-ascii');

% Print Table 2
Table2 = [CARE_quartiles_005 CARE_quartiles_001];
[N, M] = size(Table2);

for i = 1 : N
    fprintf('%10.5f  & ', Table2(i, 1 : M - 1)); 
    fprintf('%10.5f  ', Table2(i, M));     
    fprintf(' \\\\ \n');
end
