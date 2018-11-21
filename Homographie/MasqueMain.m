close all
clear all

%Chargement de la vidéo
vid = VideoReader('vid_in2.mp4');
numFrames = get(vid,'NumberOfFrames');

%Extraction d'une frame
frame = read(vid,100);

%% Etape 1 : On crée une image Region qui contient des 0 jusqu’au 3/4 de l’image, et des 1 à l’intérieur de ce rectangle R (car c’est proche de là où commence la main sur la feuille).
Region = zeros(100);
for x = 1:100
    for y = 1:100
        if x > 76 && y>26 && y <76
            Region(y,x) = 1;
        end
    end
end

%% Etape 2 : On projette par homographie cette image dans le cadre de la vidéo. On obtient le Masque1 qui contient des 0 de partout en dehors de la région R, et des 1 dans la région R.

[hImg,lImg] = size(Region);
coinsImage = [1;1;1;lImg;hImg;lImg;hImg;1];
coinsVideo = corner(frame);
H = TrouveH(coinsVideo, coinsImage);

[Ax1,Ay1,Bx1,By1]=appli_homo_non_opti(frame,Region,H);
frame=projection(frame,Region,Ax1,Ay1,Bx1,By1);
%% Etape 3 : Masque2 qui détecte la feuille grâce à la couleur

R = frame(:,:,1);
G = frame(:,:,2);
B = frame(:,:,3);
thold = 120;
mask = find(G>thold & B>thold);
mask2 = find(G<thold & B<thold);
R(mask) = 1 ;
G(mask) = 1 ;
B(mask) = 1;
R(mask2) = 0 ;
G(mask2) = 0 ;
B(mask2) = 0;
Masque2 = cat(3,R,G,B);
%% Etape 4 : On prend le contraire de Masque2, Masque2* afin de détecter la main.

Masque2 = 1 - Masque2;
J = Masque2(:,:,2);
%image(Masque2);
%% Etape 5 : On multiplie Masque1 et Masque2* ensemble et on obtient MasqueMain qui contient des 1 sur la zone de la main et des 0 partout ailleurs.

%% Etape 6 : Dans la vidéo, on réinsère la valeur des pixels qui correspondent aux endroits où il y a des 1 dans MasqueMain.

%%  Display Resul