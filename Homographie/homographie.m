close all
clear all

%Chargement de la vid�o
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

for i = 1:hVid
    for j = 1:lVid
        i
        j
        A = [i j];
        AH = homogeneisator(A)
        BH = AH * H
        B = dehomogeneisator(BH)
        B = int16(B)
        
        Bx = B(1)
        By = B(2)
        
        if (Bx < lImg) && (Bx > 0) && (By > 0) && (By < hImg) %si le point est dans l'image
            %on remplace par le pixel de la vid�o par le pixel de l'image
            frame(i,j) = img(Bx,By); %r�cup�re le RGB normalement 
        end
            
        
    end
end

image(frame)