function [ x,y ] = maxlocal(image, startX, startY, size )
%MAXLOCAL Summary of this function goes here
%   Detailed explanation goes here
x = startX;
y = startY;

for i = startX-size/2:startX+size/2
     for u = startY-size/2: startY+size/2
        
         if image(u,i) > image(y,x)
             x = i;
             y = u;
         end 
     end 
end 
end

