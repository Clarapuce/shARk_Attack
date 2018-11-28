v = VideoWriter('mavideo.avi');
v.FrameRate = 25;
open(v);
%=========PARAMETRES VIDEO PAPIER==============
vid = VideoReader('vid_in2.mp4');
numFrames = get(vid,'NumberOfFrames');


%=========PARAMETRES VIDEO PROJETER==============
vid2=VideoReader('shark.avi');
numFrames2 = get(vid2,'NumberOfFrames');

%% Calcul de la matrice des coins
coins = corners(vid);
%% Extraction d'une frame

for i=1:numFrames
    frame = read(vid,i);
    frame2 = read(vid2,i+32);
    main = MasqueMain(frame, coins(i));
    newframe=homographie(frame,frame2,coins(i));  
    newframe = ramenerMain(frame,newframe,main);
    writeVideo(v, newframe);
end
close(v)