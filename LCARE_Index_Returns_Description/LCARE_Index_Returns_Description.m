
clear all; clc;

data   = load('DataIndices.dat');
r_DAX  = diff(log(data(:, 1)));       % r_DAX daily data
r_FTSE = diff(log(data(:, 2)));       % r_FTSE daily data
r_SP   = diff(log(data(:, 3)));       % r_SP daily data

r                         = [r_DAX r_FTSE r_SP];
LCARE_Index_Returns_Table = [(mean(r))' (median(r))' (min(r))' (max(r))'...
                            (std(r))' (skewness(r))' (kurtosis(r))'];

save('LCARE_Index_Returns_Table', 'LCARE_Index_Returns_Table', '-ascii');
