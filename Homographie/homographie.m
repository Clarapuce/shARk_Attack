close all
clear all

%Chargement de la vidéo
vid = VideoReader('vid_in2.mp4');
numFrames = get(vid,'NumberOfFrames');

%Extraction d'une frame
frame = read(vid,1);

%trouver les 4 coins 
coinsVideo = corner(frame);
[hVid,lVid,profVid] = size(frame);

%les coins de l'image
img = imread('pinkshark.png');
[hImg,lImg,profImg] = size(img);
coinsImage = [0;0;0;lImg;hImg;lImg;hImg;0];
H = TrouveH(coinsVideo, coinsImage);

[Ax,Ay] = meshgrid(1:lVid, 1:hVid);
Ax = reshape(Ax,[1 lVid*hVid]);
Ay = reshape(Ay,[1 lVid*hVid]);
S1=ones(1,lVid*hVid);
A = [Ax;Ay;S1];

B = H * A;
Bx = B(1,:);
By = B(2,:);
S2 = B(3,:);
Bx = int16(Bx ./ S2);
By = int16(By ./ S2);
pos = find((Bx>0).*(Bx <= hImg).*(By >0).*(By<=lImg)); %position de tout ceux qui respectent ces conditions
Bx = Bx(pos);
By = By(pos);
Ax = Ax(pos);
Ay = Ay(pos);
    
frame(Ay + (Ax-1) * hVid) = img(By + (Bx -1) * hImg); %premier plan, rouge
frame(Ay + (Ax-1) * hVid + hVid*lVid) = img(By + (Bx -1) * hImg+hImg*lImg); %on rajoute la taille de l'image pour passer au plan vert
frame(Ay + (Ax-1) * hVid + 2*hVid*lVid) = img(By + (Bx -1) * hImg+2*hImg*lImg); %on rajoute deux fois la taille de l'image pour passer au plan vert
% for i = 1:hVid
%     for j = 1:lVid
%         A = [j;i];
%         AH = homogeneisator(A);
%         BH = H*AH ;
%         B = dehomogeneisator(BH);
%         B = int16(B);
%         
%         Bx = B(1);
%         By = B(2);
%         
%         if (Bx <= lImg) && (Bx > 0) && (By > 0) && (By <= hImg) %si le point est dans l'image
%             %on remplace par le pixel de la vidéo par le pixel de l'image
%             frame(i,j,1) = img(Bx,By,1); %récupère le RGB normalement 
%             frame(i,j,2) = img(Bx,By,2);
%             frame(i,j,3) = img(Bx,By,3);
%         end          
%         
%     end
% end

image(frame)