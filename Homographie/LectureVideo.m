close all
clear all

%=========PARAMETRES VIDEO PAPIER==============
vid = VideoReader('vid_in2.mp4');
numFrames = get(vid,'NumberOfFrames');
frame = read(vid,1);

%=========PARAMETRES VIDEO PROJETER==============
vid2=VideoReader(shark.avi);
%Extraction d'une frame

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