
function Out = LCARE_Estimation(y, tau)

  Objective = @(th) - LCARE_Loglik(y, tau, th);
  Options   = optimset('Display', 'off', 'Algorithm', 'interior-point', ...
                'TolX', 1e-3, 'TolFun', 1e-3, 'MaxIter', 1000);
  th0       = [0.00, 0.00, 0.00, 0.00, 0.01]';
  A         = [0 0 0 0 -1];
  b         = 0;
  
  [th_est, lik_value] = fmincon(Objective, th0, A, b, [], [], ...
                        [], [], [], Options);
  Out                 = [th_est', lik_value]';

end


