
function Out = LCARE_Loglik(y, tau, th)

  n          = length(y);
  y_lag      = y(1 : 1 : n - 1, 1);
  y_lag_plus = (y_lag .* (y_lag > 0)) .^ 2;
  y_lag_neg  = (y_lag .* (y_lag < 0)) .^ 2;

  u  = y(2 : n, 1) - th(1) - th(2) * y_lag - ...
        th(3) * y_lag_plus - th(4) * y_lag_neg; 
  w  = sqrt(abs(th(5)) / (1 - 2 / pi * (tau / sqrt(1 + tau ^ 2))^2));
  mu = - tau * w / sqrt(1 + tau^2) * sqrt(2 / pi); 
  
  fe_u = 1 / w * sqrt(2 / pi) * exp(-((u - mu) .^ 2) / (2 * w^2)) .* ...
          (cdf('Normal', tau * (u - mu) / w, 0, 1));
  Out = sum(log(fe_u));

end


