function [ mean ] = calc_mean( Im, i_b, j_b, i_e, j_e )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


mean = 0;
count = 0;
for i=i_b:1:i_e
    for j=j_b:1:j_e
        mean = mean + Im(i,j);
        count = count + 1;
    end;
end;

mean = mean/count;

end

