function Out = LCARE_Loglik(y, tau, th)

  n          = length(y);
  y_lag      = y(1 : 1 : n - 1, 1);
  y_lag_plus = (y_lag .* (y_lag > 0)) .^ 2;
  y_lag_neg  = (y_lag .* (y_lag < 0)) .^ 2;

  e             = y(2 : n, 1) - th(1) - th(2) * y_lag - th(3) * y_lag_plus ...
                    - th(4) * y_lag_neg;
  rho_tau       = abs(tau - 1 * (e <= 0)) .* e .^ 2;
  f_y           = 2 / sqrt(th(5)) * (sqrt(pi / abs(tau - 1)) + ...
                    sqrt(pi / tau))^(-1) * exp (- rho_tau / th(5));
  f_y(f_y == 0) = 1;
  Out           = sum(log(f_y));

end