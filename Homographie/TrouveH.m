% si on livre les 4 points sous ce format là
function [H] = TrouveH(coinsVideo, coinsImage)

xA = coinsVideo(1,1); %ligne, colonne
yA = coinsVideo(1,2);
xB = coinsVideo(2,1);
yB = coinsVideo(2,2);
xC = coinsVideo(3,1);
yC = coinsVideo(3,2);
xD = coinsVideo(4,1);
yD = coinsVideo(4,2);

xAp = coinsImage(1);
yAp = coinsImage(2);
xBp = coinsImage(3);
yBp = coinsImage(4);
xCp = coinsImage(5);
yCp = coinsImage(6);
xDp = coinsImage(7);
yDp = coinsImage(8);

% on a la matrice :
mat1 = [xA yA 1 0 0 0 -xA*xAp -yA*xAp;0 0 0 xA yA 1 -xA*yAp -yA*yAp;xB yB 1 0 0 0 -xB*xBp -yB*xBp;0 0 0 xB yB 1 -xB*yBp -yB*yBp;xC yC 1 0 0 0 -xC*xCp -yC*xCp ;0 0 0 xC yC 1 -xC*yCp -yC*yCp;xD yD 1 0 0 0 -xD*xDp -yD*xDp ;0 0 0 xD yD 1 -xD*yDp -yD*yDp];
    % or : mat1 * X = coinsImage --> X = inv(mat1) * coinsImage 
    
X = mat1 \ coinsImage ;

H11 = X(1);
H12 = X(2);
H13 = X(3);
H21 = X(4);
H22 = X(5);
H23 = X(6);
H31 = X(7);
H32 = X(8);
H33 = 1;

H = [H11 H12 H13;H21 H22 H23;H31 H32 H33];
end