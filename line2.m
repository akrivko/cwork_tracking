function [result_image] = line2( input_image, color, x1, x2, y1, y2 )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

result_image = input_image;

deltaX = abs(x2 - x1);
deltaY = abs(y2 - y1);
if (x1 < x2)
    signX = 1;
else
    signX = -1;
end;

if (y1 < y2)
    signY = 1;
else
    signY = -1;
end;

error = deltaX - deltaY;

result_image(x2, y2) = color;

while(x1 ~= x2 || y1 ~= y2) 
    result_image(x1, y1) = color;
    error2 = error * 2;
    
    if(error2 > -deltaY)
        error = error - deltaY;
        x1 = x1 + signX;
    end;
    
    if(error2 < deltaX)
        error = error + deltaX;
        y1 = y1 + signY;
    end;
end;


end

