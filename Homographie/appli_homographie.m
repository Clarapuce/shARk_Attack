function [Ax,Ay,Bx,By,B] = appli_homographie(frame,img,H)
[hImg,lImg,Prof] = size(img);
[hVid,lVid,Prof2] = size(frame);
[Ax,Ay] = meshgrid(1:lVid, 1:hVid);%OK
Ax = reshape(Ax,[1 lVid*hVid]);
Ay = reshape(Ay,[1 lVid*hVid]);
SA=ones(1,hVid*lVid);
A = [Ax;Ay;SA]; %OK
%H OK
B = H * A; %PAS OK
Bx = B(1,:);
By = B(2,:);
SB = B(3,:);
Bx = double(int16(Bx ./ SB));
By = double(int16(By ./ SB)); %OK


end