function [MasqueGlobal] = MasqueMain(frame, coin)
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

[hFrame,lFrame,profFrame] = size(frame);
Region = cat(3,Region,Region,Region);
Masque1 = zeros(hFrame,lFrame,profFrame);
Masque1 = homographie(Masque1,Region, coin);

%% Etape 3 : Masque2 qui détecte la feuille grâce à la couleur

R = frame(:,:,1);
G = frame(:,:,2);
B = frame(:,:,3);
tholdG = 125;
tholdB = 165;
mask = find(G>tholdG & B>tholdB);
mask2 = find(G<tholdG & B<tholdB);
R(mask) = 1 ;
G(mask) = 1 ;
B(mask) = 1;
R(mask2) = 0 ;
G(mask2) = 0 ;
B(mask2) = 0;
Masque2 = cat(3,R,G,B);
%% Etape 4 : On prend le contraire de Masque2, Masque2* afin de détecter la main.
%De partout où il ya des 0 --> 1
%De partout où il ya des 1 --> 0
Masque2 = 1 - Masque2;
Masque2 = double(Masque2);
%% Etape 5 : On multiplie Masque1 et Masque2* ensemble et on obtient MasqueMain qui contient des 1 sur la zone de la main et des 0 partout ailleurs.
MasqueGlobal = Masque1 .* Masque2;