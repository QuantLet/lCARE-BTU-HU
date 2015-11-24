
% tau = 0.01

clear all; clc; 

load('LCARE_001.mat');

llen_DAX_001_c  = lcare_DAX_001_c(11, :)';
llen_FTSE_001_c = lcare_FTSE_001_c(11, :)';
llen_SP_001_c   = lcare_SP_001_c(11, :)';
llen_DAX_001_d  = lcare_DAX_001_d(11, :)';
llen_FTSE_001_d = lcare_FTSE_001_d(11, :)';
llen_SP_001_d   = lcare_SP_001_d(11, :)';
len_001         = [llen_DAX_001_c llen_FTSE_001_c  llen_SP_001_c ...
                   llen_DAX_001_d  llen_FTSE_001_d llen_SP_001_d];

% smooth line              
lcare_length_001_d_week = Smooth_mean(len_001, 20);   

figure
subplot(2, 3, 1); 
plot(lcare_DAX_001_c(11, :), '-b', 'LineWidth', 1.5); 
title('DAX', 'FontName', 'Times New Roman', 'FontSize',16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);  
hold on; 
plot(lcare_length_001_d_week(:, 1), '-r', 'LineWidth', 1.5); 
ylabel('Length'); ylim([1, 180]); xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; hold on; 
set(gca, 'xtick', [1  1045 2088]);
Length = {'60', '120', '180'}; hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); set(gca,'xgrid','on')

subplot(2, 3, 2); 
plot(lcare_FTSE_001_c(11, :), '-b', 'LineWidth', 1.5); 
title('FTSE 100', 'FontName', 'Times New Roman', 'FontSize',16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);  
hold on; 
plot(lcare_length_001_d_week(:, 2), '-r', 'LineWidth', 1.5);
ylabel(''); ylim([1, 180]); xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; hold on; 
set(gca, 'xtick', [1  1045 2088]);
Length = {'60', '120', '180'}; hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); set(gca,'xgrid','on')

subplot(2, 3, 3); 
plot(lcare_SP_001_c(11, :), '-b', 'LineWidth', 1.5); 
title('S&P 500');
title('S&P 500', 'FontName', 'Times New Roman', 'FontSize',16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);  
hold on; 
plot(lcare_length_001_d_week(:, 3), '-r', 'LineWidth', 1.5);
ylabel(''); ylim([1, 180]); xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; hold on; 
set(gca, 'xtick', [1  1045 2088]);
Length = {'60', '120', '180'}; hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); set(gca,'xgrid','on')

subplot(2, 3, 4); 
plot(lcare_DAX_001_d(11, :), '-b', 'LineWidth', 1.5);
title('DAX', 'FontName', 'Times New Roman', 'FontSize',16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);  
hold on; 
plot(lcare_length_001_d_week(:, 4), '-r', 'LineWidth', 1.5);
ylabel('Length'); ylim([1, 180]); xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; hold on; 
set(gca, 'xtick', [1  1045 2088]);
Length = {'60', '120', '180'}; hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); set(gca,'xgrid','on')

subplot(2, 3, 5); 
plot(lcare_FTSE_001_d(11, :), '-b', 'LineWidth', 1.5);
title('FTSE 100', 'FontName', 'Times New Roman', 'FontSize',16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);  
hold on; 
plot(lcare_length_001_d_week(:, 5), '-r', 'LineWidth', 1.5);
ylabel(''); ylim([1, 180]); xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; hold on; 
set(gca, 'xtick', [1  1045 2088]);
Length = {'60', '120', '180'}; hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); set(gca,'xgrid','on')

subplot(2, 3, 6); 
plot(lcare_SP_001_d(11, :), '-b', 'LineWidth', 1.5);
title('S&P 500', 'FontName', 'Times New Roman', 'FontSize',16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);  
hold on; 
plot(lcare_length_001_d_week(:, 6), '-r', 'LineWidth', 1.5);
ylabel(''); ylim([1, 180]); xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; hold on; 
set(gca, 'xtick', [1  1045 2088]);
Length = {'60', '120', '180'}; hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); set(gca,'xgrid','on')

