close all
clear all

%Chargement de la vidéo
vid = VideoReader('vid_in2.mp4');
numFrames = get(vid,'NumberOfFrames');

%Extraction d'une frame
frame = read(vid,1);

%trouver les 4 coins 
%coinsVideo = corner(frame);
[hVid,lVid] = size(frame);
coinsVideo = [1 1;lVid 1;lVid hVid;1 hVid];
%x puis y
%les coins de l'image
img = imread('pinkshark.png');
[hImg,lImg] = size(img);
coinsImage = [1;1;1;lImg;hImg;lImg;hImg;1];
H = TrouveH(coinsVideo, coinsImage); %OK

[Ax1,Ay1,Bx1,By1]=appli_homo_non_opti(frame,img,H);
%[Ax2,Ay2,Bx2,By2]=appli_homographie(frame,img,H);
frame=projection(frame,img,Ax1,Ay1,Bx1,By1);
image(frame)