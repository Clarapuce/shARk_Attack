close all
clear all

%=========PARAMETRES VIDEO==============
vid = VideoReader('vid_in2.mp4');
numFrames = get(vid,'NumberOfFrames');

%Extraction d'une frame
frame = read(vid,1);
%trouver les 4 coins 
coinsVideo = corner(frame);
[hVid,lVid,Prof] = size(frame);
%coinsVideo = [1;1;lVid;1;lVid;hVid;1;hVid];
%[x1;y1;x2;y2;... ]
%les coins de l'image

%=========PARAMETRES IMAGE==============
img = imread('pinkshark.png');
[hImg,lImg,Prof2] = size(img);
coinsImage = [1;1;lImg;1;lImg;hImg;1;hImg];
H = TrouveH(coinsVideo, coinsImage); %OK


%=========APPLICATION HOMOGRAPHIE==============
%[Ax,Ay,Bx,By]=appli_homo_non_opti(frame,img,H);
[Ax,Ay,Bx,By]=appli_homographie(frame,img,H);
[Ax,Ay,Bx,By]=garder_bon_points(Ax,Ay,Bx,By,img);
frame=projection(frame,img,Ax,Ay,Bx,By);


%=========AFFICHAGE IMAGE==============
image(frame)