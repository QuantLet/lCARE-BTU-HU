% ---------------------------------------------------------------------
% Project:      LCARE
% ---------------------------------------------------------------------
% Quantlet:     LCARE_Intervals
% ---------------------------------------------------------------------
% Description:  Generate analytical intervals for LCARE model
% ---------------------------------------------------------------------
% Keywords:     simulation, time-series, decomposition, calibration,
%               basis
% ---------------------------------------------------------------------
% See also:     
% ---------------------------------------------------------------------
% Author:       Andrija Mihoci, Xiu Xu 20151111
% ---------------------------------------------------------------------

% Input
n_0 = 20;         
c   = 1.25;       
K   = 11;         
n_K = 250;        

% Programme Code
n_k = round((n_0 * c)) .* ones(K, 1);
for l = 2 : K
  n_k(l) = round(n_k(l - 1) * c);
end
n_k           = [n_0; n_k]; 
n_k(K + 1, 1) = n_K;

% Output
CARE_Intervals = [(0 : 1 : K)', n_k, n_K .* ones(K + 1, 1) - n_k + 1, n_K .* ones(K + 1, 1)...
                  - [0; n_k(1 : end - 1, : )], n_K .* ones(K + 1, 1) - ...
                  [n_k(2 : end, :); n_K + 1] + 1, n_K .* ones(K + 1, 1) - ...
                  n_k, n_K .* ones(K + 1, 1) - n_k + 1, n_K .* ones(K + 1, 1), ...
                  n_K .* ones(K + 1, 1) - [n_k(2 : end, :); n_K + 1] + 1, n_K .* ones(K + 1, 1)];
save('CARE_Intervals', 'CARE_Intervals', '-ascii');
