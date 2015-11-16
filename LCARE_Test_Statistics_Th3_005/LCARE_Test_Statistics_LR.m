
function Out = LCARE_Test_Statistics_LR(y, tau)

CARE_Intervals = load('CARE_Intervals');
B              = (CARE_Intervals(2, 4) : -1 : CARE_Intervals(11, 3))' + 1;
L_B            = arrayfun(@(x) LCARE_Estimation_Loglik(y(x : 1 : ...
                    CARE_Intervals(1, 10), 1), tau), B);

k      = 1; 
J1     = (CARE_Intervals(k + 1, 4) : - 1 : CARE_Intervals(k + 1, 3))';
L_A_k1 = arrayfun(@(x) LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5)...
         : 1 : x, 1), tau), J1);
L_I_2  = LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 9) : 1 : ...
         CARE_Intervals(k + 1, 10), 1), tau) * ones(length(J1), 1);

k      = 2; 
J2     = (CARE_Intervals(k + 1, 4) : - 1 : CARE_Intervals(k + 1, 3))';
L_A_k2 = arrayfun(@(x) LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5)...
         : 1 : x, 1), tau), J2);
L_I_3  = LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 9) : 1 : ...
         CARE_Intervals(k + 1, 10), 1), tau) *ones(length(J2), 1);

k      = 3; 
J3     = (CARE_Intervals(k + 1, 4) : - 1 : CARE_Intervals(k + 1, 3))';
L_A_k3 = arrayfun(@(x) LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5)...
         : 1 : x, 1), tau), J3);
L_I_4  = LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 9) : 1 : ...
         CARE_Intervals(k + 1, 10), 1), tau) * ones(length(J3), 1);

k      = 4; 
J4     = (CARE_Intervals(k + 1, 4) : - 1 : CARE_Intervals(k + 1, 3))';
L_A_k4 = arrayfun(@(x) LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5)...
         : 1 : x, 1), tau), J4);
L_I_5  = LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 9) : 1 : ...
         CARE_Intervals(k + 1, 10), 1), tau) * ones(length(J4), 1);

k      = 5; 
J5     = (CARE_Intervals(k + 1, 4) : - 1 : CARE_Intervals(k + 1, 3))';
L_A_k5 = arrayfun(@(x) LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5)...
         : 1 : x, 1), tau), J5);
L_I_6  = LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 9) : 1 : ...
         CARE_Intervals(k + 1, 10), 1), tau) * ones(length(J5), 1);

k      = 6; 
J6     = (CARE_Intervals(k + 1, 4) : - 1 : CARE_Intervals(k + 1, 3))';
L_A_k6 = arrayfun(@(x) LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5)...
         : 1 : x, 1), tau), J6);
L_I_7  = LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 9) : 1 : ...
         CARE_Intervals(k + 1, 10), 1), tau) * ones(length(J6), 1);

k      = 7; 
J7     = (CARE_Intervals(k + 1, 4) : - 1 : CARE_Intervals(k + 1, 3))';
L_A_k7 = arrayfun(@(x) LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5)...
         : 1 : x, 1), tau), J7);
L_I_8  = LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 9) : 1 : ...
         CARE_Intervals(k + 1, 10), 1), tau) * ones(length(J7), 1);

k      = 8; 
J8     = (CARE_Intervals(k + 1, 4) : - 1 : CARE_Intervals(k + 1, 3))';
L_A_k8 = arrayfun(@(x) LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5)...
         : 1 : x, 1), tau), J8);
L_I_9  = LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 9) : 1 : ...
         CARE_Intervals(k + 1, 10), 1), tau) * ones(length(J8), 1);

k      = 9; 
J9     = (CARE_Intervals(k + 1, 4) : - 1 : CARE_Intervals(k + 1, 3))';
L_A_k9 = arrayfun(@(x) LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5)...
         : 1 : x, 1), tau), J9);
L_I_10 = LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 9) : 1 : ...
         CARE_Intervals(k + 1, 10), 1), tau) * ones(length(J9), 1);

k       = 10; 
J10     = (CARE_Intervals(k + 1, 4) : - 1 : CARE_Intervals(k + 1, 3))';
L_A_k10 = arrayfun(@(x) LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 5)...
          : 1 : x, 1), tau), J10);
L_I_11  = LCARE_Estimation_Loglik(y(CARE_Intervals(k + 1, 9) : 1 : ...
          CARE_Intervals(k + 1, 10), 1), tau) * ones(length(J10), 1);

L_A  = [L_A_k1; L_A_k2; L_A_k3; L_A_k4; L_A_k5; L_A_k6; L_A_k7; ...
        L_A_k8; L_A_k9; L_A_k10];
L_I  = [L_I_2; L_I_3; L_I_4; L_I_5; L_I_6; L_I_7; L_I_8; L_I_9; ...
        L_I_10; L_I_11];
L_LR = L_A + L_B - L_I;
Out  = [L_A; L_B; L_I; L_LR];

end


