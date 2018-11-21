function [] = homographie(frame, img )


H = TrouveH(coinsVideo, coinsImage); %OK

%=========APPLICATION HOMOGRAPHIE==============


% t1=isequal(Ax,Ax1);
% t2=isequal(Ay,Ay1);
% t3=isequal(Bx,Bx1);
% t4=isequal(By,By1);
[Ax1,Ay1,Bx1,By1]=appli_homographie(frame,img,H);
[Ax1,Ay1,Bx1,By1]=garder_bon_points(Ax1,Ay1,Bx1,By1,img);
frame=projection(frame,img,Ax1,Ay1,Bx1,By1);

%[Ax,Ay,Bx,By]=appli_homo_non_opti(frame,img,H);
% [Ax,Ay,Bx,By]=garder_bon_points(Ax,Ay,Bx,By,img);
% frame=projection(frame,img,Ax,Ay,Bx,By);

%=========AFFICHAGE IMAGE==============
image(frame)

end

