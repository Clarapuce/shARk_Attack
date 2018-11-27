close all
clear all

%Chargement de la vidéo
vid = VideoReader('vid_in2.mp4');

corners(vid);




% [Ix,Iy] = imgradientxy(A);

% 
% Hx = -X.*exp(-(X.^2+Y.^2)/(2*sigma^2));
% Hy = -Y.*exp(-(X.^2+Y.^2)/(2*sigma^2));
% Gx = conv2(A, Hx, 'same');
% Gy = conv2(A, Hy, 'same');
% 
% G = (Gx .* Gx + Gy .* Gy) .^ 0.5;
% 
% image(G);
% 
% % Ix = conv2(A, Gx, 'same');
% % Iy = conv2(A, Gy, 'same');
% 

% % figure, image(Ix2);
% % Cxx = conv2(Ix2, G, 'same');
% % Cyy = conv2(Iy2, G, 'same');
% % Cxy = conv2(Ixy, G, 'same');
% 
% image(Ix2);
%  


