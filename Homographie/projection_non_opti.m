function [frame] = projection_non_opti(frame,img,Ax,Ay,Bx,By)
frame(Ay,Ax,1) = img(Bx,By,1); %récupère le RGB normalement 
frame(Ay,Ax,2) = img(Bx,By,2);
frame(Ay,Ax,3) = img(Bx,By,3);
end