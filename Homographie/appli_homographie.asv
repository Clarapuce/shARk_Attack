function [Ax,Ay,Bx,By] = appli_homographie(frame,img,H)
[hImg,lImg] = size(img);
[hVid,lVid] = size(frame);
[Ax,Ay] = meshgrid(1:lVid, 1:hVid);%OK
Ax = reshape(Ax,[1 lVid*hVid]);
Ay = reshape(Ay,[1 lVid*hVid]);
SA=ones(1,size(Ax)*size(Ay));
A = [Ax;Ay;SA]; %OK
%H OK
B = H * A; %PAS OK
Bx = B(1,:);
By = B(2,:);
SB = B(3,:);
Bx = int16(Bx ./ SB);
By = int16(By ./ SB); %OK

pos = find((Bx>0).*(Bx <= hImg).*(By >0).*(By<=lImg)); %position de tout ceux qui respectent ces conditions
Bx = Bx(pos);
By = By(pos);
Ax = Ax(pos);
Ay = Ay(pos);
end