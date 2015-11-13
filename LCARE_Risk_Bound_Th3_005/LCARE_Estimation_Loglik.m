
function Out = LCARE_Estimation_Loglik(y, tau)

  Objective = @(th) -LCARE_Loglik(y, tau, th);
  Options   = optimset('Display', 'off', 'Algorithm', 'interior-point', 'TolX', 1e-3, 'TolFun', 1e-3, 'MaxIter', 1000);
  th0       = [0.10, 0.10, 1.00, 1.00, 0.01]';
  A         = [0 0 0 0 -1];
  b         = 0;
  
  [~, lik_value] = fmincon(Objective, th0, A, b, [], [], [], [], [], Options);
  Out            = -lik_value;
  
end


