% ---------------------------------------------------------------------
% Project:      LCARE
% ---------------------------------------------------------------------
% Quantlet:     LCARE_2b_Simulation
% ---------------------------------------------------------------------
% Description:  Simulates paths of a CARE model with fixed parameter
%               vector
% ---------------------------------------------------------------------
% Keywords:     simulation, time-series, process, data, basis, model              
% ---------------------------------------------------------------------
% See also:     LCARE_2a_rsn
% ---------------------------------------------------------------------
% Author:       Andrija Mihoci, Xiu Xu 20150219
% ---------------------------------------------------------------------

function [y_t_005, y_t_001] = LCARE_2b_Simulation(Th_005, Th_001)

er_005 = load('er_005.dat');
er_001 = load('er_001.dat'); 

y_sim_005      = zeros(size(er_005, 1) + 1, length(er_005)); y_sim_005(1, :) = 0.00045;
y_sim_plus_005 = zeros(size(y_sim_005)); y_sim_neg_005 = zeros(size(y_sim_005));
for t = 1 : 1 : (size(y_sim_005, 1) - 1)   
  y_sim_plus_005(t, :) = (y_sim_005(t, :) .* (y_sim_005(t, :) > 0)) .^ 2;
  y_sim_neg_005(t, :)  = (y_sim_005(t, :) .* (y_sim_005(t, :) < 0)) .^ 2;
  y_sim_005(t + 1, :)  = Th_005(1) + Th_005(2) * y_sim_005(t, :) + ...
      Th_005(3) * y_sim_plus_005(t, :) + Th_005(4) * y_sim_neg_005(t, :) + er_005(t, :);
end
y_t_005 = y_sim_005(2 : end, :);
save('y_t_005', 'y_t_005', '-ascii');

y_sim_001      = zeros(size(er_001, 1) + 1, length(er_001)); y_sim_001(1, :) = 0.00045;
y_sim_plus_001 = zeros(size(y_sim_001)); y_sim_neg_001 = zeros(size(y_sim_001));
for t = 1 : 1 : (size(y_sim_001, 1) - 1)   
  y_sim_plus_001(t, :) = (y_sim_001(t, :) .* (y_sim_001(t, :) > 0)) .^ 2;
  y_sim_neg_001(t, :)  = (y_sim_001(t, :) .* (y_sim_001(t, :) < 0)) .^ 2;
  y_sim_001(t + 1, :)  = Th_001(1) + Th_001(2) * y_sim_001(t, :) + ...
      Th_001(3) * y_sim_plus_001(t, :) + Th_001(4) * y_sim_neg_001(t, :) + er_001(t, :);
end
y_t_001 = y_sim_001(2 : end, :);
save('y_t_001', 'y_t_001', '-ascii');

end


