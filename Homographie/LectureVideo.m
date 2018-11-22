close all
clear all

v = VideoWriter('mavideo.avi');
v.FrameRate = 25;
open(v);
%=========PARAMETRES VIDEO PAPIER==============
vid = VideoReader('vid_in2.mp4');
numFrames = get(vid,'NumberOfFrames');
frame = read(vid,1);

%=========PARAMETRES VIDEO PROJETER==============
vid2=VideoReader('shark.avi');
numFrames2 = get(vid2,'NumberOfFrames');

%Extraction d'une frame
for i=32:numFrames
    frame2 = read(vid2,i);
    newframe=homographie(frame,frame2);
    writeVideo(v, newframe);
end
close(v)