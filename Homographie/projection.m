function [frame] = projection(frame,img,Ax,Ay,Bx,By)
[hVid,lVid] = size(frame);
[hImg,lImg] = size(img);
frame(Ay + (Ax-1) * hVid) = img(By + (Bx -1) * hImg); %position 1D, premier pla,, rouge
frame(Ay + (Ax-1) * hVid + hVid*lVid) = img(By + (Bx -1) * hImg+hImg*lImg); %on rajoute la taille de l'image pour passer au plan vert
frame(Ay + (Ax-1) * hVid + 2*hVid*lVid) = img(By + (Bx -1) * hImg+2*hImg*lImg); %on rajoute deux fois la taille de l'image pour passer au plan bleu

end