function [frame] = projection(frame,img,Ax,Ay,Bx,By)
[hVid,lVid,Prof] = size(frame);
[hImg,lImg,Prof2] = size(img);

%PLAN ROUGE
frame(Ay + (Ax-1) * hVid) = img(By + (Bx -1) * hImg);
%position 1D

%PLAN VERT
frame(Ay + (Ax-1) * hVid + hVid*lVid) = img(By + (Bx -1) * hImg + hImg*lImg); 
%on rajoute la taille de l'image pour passer au plan vert

%PLAN BLEU
frame(Ay + (Ax-1) * hVid + 2*hVid*lVid) = img(By + (Bx -1) * hImg + 2*hImg*lImg); 
%on rajoute deux fois la taille de l'image pour passer au plan bleu

end