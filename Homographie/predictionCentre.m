function [xCenter ,yCenter] = predictionCentre(xN1,yN1, xN2,yN2)
%xN1 correspont � la position de x � n-1 sachant que l'on cherche )
%calculer sa position � N
xCenter = round(xN1 + (xN1 - xN2) / 2);
yCenter = round(yN1 + (yN1 - yN2) / 2);
end