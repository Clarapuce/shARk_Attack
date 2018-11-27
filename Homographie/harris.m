function D = harris(A, sigmaG, sigmaC,k)

    [X,Y] = meshgrid(-3 * sigmaG: 3 * sigmaG);
    
%     Hx2 = -X2.*(exp(-(X2.^2+Y2.^2)/(2*sigmaC^2))/(2*pi*sigmaC^4)); % Equivaut à Gsigma2
%     
%     Gx = ((-X / (2 * pi * sigmaG ^ 4)) .* exp(-(X .^ 2 + Y .^ 2))) / (2 * sigmaG .^ 2);
%     Gy = ((-Y / (2 * pi * sigmaG ^ 4)) .* exp(-(X .^ 2 + Y .^ 2))) / (2 * sigmaG .^ 2);

    Gx=-X.*(exp(-(X.^2+Y.^2)/(2*sigmaG^2))/(2*pi*sigmaG^4));
    Gy=-Y.*(exp(-(X.^2+Y.^2)/(2*sigmaG^2))/(2*pi*sigmaG^4));
    
    Ix = conv2(A, Gx, 'same');
    Iy = conv2(A, Gy, 'same');

    Ix2 = Ix.^2;
    Iy2 = Iy.^2;
    Ixy = Ix .* Iy;

    [X,Y] = meshgrid(-3 * sigmaC : 3 * sigmaC);
    G = exp(-(X.^2 + Y.^2)/(2*sigmaC^2)) / (2*pi*sigmaC^2);

    Cxx = conv2(Ix2, G, 'same');
    Cyy = conv2(Iy2, G, 'same');
    Cxy = conv2(Ixy, G, 'same');

    D = Cxx .* Cyy - Cxy .^ 2 - k .*(Cxx + Cyy) .^ 2;
end
