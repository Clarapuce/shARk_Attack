function [ Ax,Ay, Bx,By ] = garder_bon_points( Ax,Ay, Bx,By, img)
[hImg,lImg,Prof] = size(img);
pos = find((Bx>0).*(Bx <= lImg).*(By >0).*(By<=hImg)); %position de tout ceux qui respectent ces conditions
Bx = Bx(pos);
By = By(pos);
Ax = Ax(pos);
Ay = Ay(pos);
end
