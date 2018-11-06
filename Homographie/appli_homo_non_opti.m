function [Ax,Ay,Bx,By] = appli_homo_non_opti(frame,img,H)
A=[];
B=[];
[hVid,lVid] = size(frame);
[hImg,lImg] = size(img);
for x = 1:lVid
    for y = 1:hVid
        a = [x;y];
        aH = homogeneisator(a);
        bH = H*aH ;
        b = dehomogeneisator(bH);
        b = int16(b);
        bx=b(1);
        by=b(2);
        
        
        if (bx <= lImg) && (bx > 0) && (by > 0) && (by <= hImg) %si le point est dans l'image
            %on remplace par le pixel de la vidéo par le pixel de l'image
            A=[A a];
            B=[B b];
        end  
        
    end
end
Ax = A(1,:);
Ay = A(2,:);
Bx = B(1,:);
By = B(2,:);
end