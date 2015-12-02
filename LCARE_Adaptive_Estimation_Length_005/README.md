
[<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/banner.png" alt="Visit QuantNet">](http://quantlet.de/index.php?p=info)

## [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/qloqo.png" alt="Visit QuantNet">](http://quantlet.de/) **LCARE_Adaptive_Estimation_005** [<img src="https://github.com/QuantLet/Styleguide-and-Validation-procedure/blob/master/pictures/QN2.png" width="60" alt="Visit QuantNet 2.0">](http://quantlet.de/d3/ia)


```yaml

Name of Quantlet: LCARE_Adaptive_Estimation_Length_005

Published in: LCARE

Description: 'Estimated length of the interval of homogeneity in 
trading days across the selected three stock markets 
from 3 January 2006 to 31 December 2014 for the modest
(upper panel, r = 0.5) and the conservative 
(lower panel, r = 1) risk cases, at expectile level 0.05.'

Keywords:
- plot
- estimation
- time-series
- process
- data
- basis
- model   
- risk
- parameter
- parametric
- threshold
- expectile

See also: 
- LCARE_Adaptive_Estimation_005
- LCARE_Adaptive_Estimation_001
- LCARE_Adaptive_Estimation_Length_001

Author: Andrija Mihoci, Xiu Xu

Submitted:  Sat, November 14 2015 by Xiu Xu

```

![Picture1](LCARE_Adaptive_Estimation_Length_005.png)



```R


 
% tau = 0.05
clear all; clc;
 
load('LCARE_005.mat');
 
llen_DAX_005_c  = lcare_DAX_005_c(11, :)';
llen_FTSE_005_c = lcare_FTSE_005_c(11, :)';
llen_SP_005_c   = lcare_SP_005_c(11, :)';
llen_DAX_005_d  = lcare_DAX_005_d(11, :)';
llen_FTSE_005_d = lcare_FTSE_005_d(11, :)';
llen_SP_005_d   = lcare_SP_005_d(11, :)';
len_005         = [llen_DAX_005_c llen_FTSE_005_c ...
                    llen_SP_005_c llen_DAX_005_d ...
                    llen_FTSE_005_d llen_SP_005_d];
 
% smooth line
lcare_length_005_d_week = Smooth_mean(len_005, 20);  
 
figure
subplot(2, 3, 1); 
plot(lcare_DAX_005_c(11, :), '-b', 'LineWidth', 1.5); 
title('DAX', 'FontName', 'Times New Roman', 'FontSize', 16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16); 
hold on; 
plot(lcare_length_005_d_week(:, 1), '-r', 'LineWidth', 1.5); 
ylabel('Length'); 
ylim([1, 180]); 
xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; 
hold on; 
set(gca, 'xtick', [1 1045 2088]);
Length = {'60', '120', '180'}; 
hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); 
set(gca, 'xgrid', 'on')
 
subplot(2, 3, 2); 
plot(lcare_FTSE_005_c(11, :), '-b', 'LineWidth', 1.5); 
title('FTSE 100', 'FontName', 'Times New Roman', 'FontSize', 16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);  
hold on; 
plot(lcare_length_005_d_week(:, 2), '-r', 'LineWidth', 1.5);
ylim([1, 180]); 
xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; 
hold on; 
set(gca, 'xtick', [1 1045 2088]);
Length = {'60', '120', '180'}; 
hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); 
set(gca, 'xgrid', 'on')
 
subplot(2, 3, 3); 
plot(lcare_SP_005_c(11, :), '-b', 'LineWidth', 1.5); 
title('S&P 500');
title('S&P 500', 'FontName', 'Times New Roman', 'FontSize', 16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);  
hold on; 
plot(lcare_length_005_d_week(:, 3), '-r', 'LineWidth', 1.5);
ylim([1, 180]); 
xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; 
hold on; 
set(gca, 'xtick', [1 1045 2088]);
Length = {'60', '120', '180'}; 
hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); 
set(gca, 'xgrid', 'on')
 
subplot(2, 3, 4); 
plot(lcare_DAX_005_d(11, :), '-b', 'LineWidth', 1.5);
title('DAX', 'FontName', 'Times New Roman', 'FontSize', 16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);  
hold on; 
plot(lcare_length_005_d_week(:, 4), '-r', 'LineWidth', 1.5);
ylabel('Length'); 
ylim([1, 180]); 
xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; 
hold on; 
set(gca, 'xtick', [1 1045 2088]);
Length = {'60', '120', '180'}; 
hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); 
set(gca, 'xgrid', 'on')
 
subplot(2, 3, 5); 
plot(lcare_FTSE_005_d(11, :), '-b', 'LineWidth', 1.5);
title('FTSE 100', 'FontName', 'Times New Roman', 'FontSize', 16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);  
hold on; 
plot(lcare_length_005_d_week(:, 5), '-r', 'LineWidth', 1.5);
ylim([1, 180]); 
xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; 
hold on; 
set(gca, 'xtick', [1 1045 2088]);
Length = {'60', '120', '180'}; 
hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); 
set(gca, 'xgrid', 'on')
 
subplot(2, 3, 6); 
plot(lcare_SP_005_d(11, :), '-b', 'LineWidth', 1.5);
title('S&P 500', 'FontName', 'Times New Roman', 'FontSize', 16); 
set(gca, 'FontName', 'Times New Roman', 'FontSize', 16);  
hold on; 
plot(lcare_length_005_d_week(:, 6), '-r', 'LineWidth', 1.5);
ylim([1, 180]); 
xlim([1, 2348]); 
Year   = {'2006', '2010', '2014'}; 
hold on; 
set(gca, 'xtick', [1 1045 2088]);
Length = {'60', '120', '180'}; 
hold on; 
set(gca, 'ytick', [60 120 180]);
set(gca, 'xticklabel', Year); 
set(gca, 'yticklabel', Length); 
set(gca, 'xgrid', 'on')
 

 

