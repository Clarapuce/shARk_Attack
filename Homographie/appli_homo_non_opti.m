function [Ax,Ay,Bx,By] = appli_homo_non_opti(frame,img,H)
[hVid,lVid,Prof] = size(frame);
[hImg,lImg,Prof2] = size(img);
Ax=zeros(1,lVid*hVid);
Ay=zeros(1,lVid*hVid);
Bx=zeros(1,lImg*hImg);
By=zeros(1,lImg*hImg);
for x = 1:lVid
    for y = 1:hVid
        a = [x;y];
        aH = [a;1];
        bH = H*aH ;
        b= [bH(1)/bH(3);bH(2)/bH(3)];
        b = int16(b);
        Ax(y + (x-1) * hVid)=a(1);
        Ay(y + (x-1) * hVid)=a(2);
        Bx(y + (x-1) * hVid)=b(1);
        By(y + (x-1) * hVid)=b(2);
         
        
    end
end
end