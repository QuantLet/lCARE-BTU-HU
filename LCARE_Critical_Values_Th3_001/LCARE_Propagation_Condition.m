
function Out = LCARE_Propagation_Condition(z, s_step, V, Tv, LR, r_ind)

% Input
K   = 11;                                 
rho = 0.25;                             

% Programme Code
B_Tv = ones(K - 1, V, K - 1);
for s = 1 : 1 : (K - 1)
    B_Tv(:, :, s) = Tv > z;
end

E_LR_Bs = mean(LR .* B_Tv, 2); PC = zeros(K - 1, 1);
for s = 1 : 1 : (K - 1)    
    PC(s) = max(E_LR_Bs(:, :, s) - (rho * s) / (K - 1) * r_ind);        
end

% Output
Out = PC(s_step);

end


