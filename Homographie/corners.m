function results = corners( vid)
%GRADIENT Summary of this function goes here
%   Detailed explanation goes here

    numFrames = get(vid,'NumberOfFrames');

    xtopleft = [685, 685];
    ytopleft = [414, 414];

    xtopright = [1339, 1339];
    ytopright = [238, 238];

    xbotleft = [631, 631];
    ybotleft = [768, 768];

    xbotright = [1427, 1427];
    ybotright = [582, 582];

    results = cell(1,numFrames);

    for f=1:numFrames
        %Extraction d'une frame
        A = read(vid,f);
        A = rgb2gray(A);

        D1 = harris(A, 2.0, 3.0, 0.05);
        D2 = abs(harris(A, 2.0, 5.0, 0.05));

        D = D1 .* D2;


        boxsize = 36;
        [xtopleft,ytopleft] = newPoint(D, boxsize, xtopleft, ytopleft);
        [xbotleft,ybotleft] = newPoint(D, boxsize, xbotleft, ybotleft);
        [xtopright,ytopright] = newPoint(D, boxsize, xtopright, ytopright);
        [xbotright,ybotright] = newPoint(D, boxsize, xbotright, ybotright);

        results{1,f} = [
          [xtopleft(1) ytopleft(1)]
          [xtopright(1) ytopright(1)]
          [xbotright(1) ybotright(1)]
          [xbotleft(1) ybotleft(1)]
        ]
        
        
        
%         B = zeros(1080,1920); 
% 
%         B(ytopleft,xtopleft) = 5;
%         B(ytopright,xtopright) = 5;
%         B(ytopright-1,xtopright) = 5;
%         B(ytopright+1,xtopright) = 5;
%         B(ytopright,xtopright-1) = 5;
%         B(ytopright,xtopright+1) = 5;
% 
%         B(ybotleft,xbotleft) = 5;
%         B(ybotleft-1,xbotleft) = 5;
%         B(ybotleft+1,xbotleft) = 5;
%         B(ybotleft,xbotleft-1) = 5;
%         B(ybotleft,xbotleft+1) = 5;
% 
% 
%         B(ybotright,xbotright) = 5;
%         B(ybotright-1,xbotright) = 5;
%         B(ybotright+1,xbotright) = 5;
%         B(ybotright,xbotright-1) = 5;
%         B(ybotright,xbotright+1) = 5;
% 
% 
%         imshowpair(A,B);
%         %imshow(D);
%         refresh;

    end

end

