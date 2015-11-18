
function Sdata = Smooth_mean(data, frequency)

[N, M] = size(data);
Sdata = data;
for i = 1 : frequency - 1   
    Sdata(i, :) = mean(data(1 : i  + frequency - 1, :));  
end

Sdata(frequency : N - frequency) = 0;
for i = frequency : N - frequency    
    Sdata(i, :) = mean(data(i - frequency + 1 : i  + frequency - 1, :));  
end

for i = N - frequency + 1 : N   
    Sdata(i, :) = mean(data(i - frequency + 1: i, :));  
end

end