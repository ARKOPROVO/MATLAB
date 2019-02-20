close all;
A=imread('coins.png');
figure,imshow(A);
title('Original image');
B=im2bw(A);
figure,imshow(B);
C=imfill(B,'holes');
figure,imshow(C);

label=bwlabel(C);
max(max(label))
im1= (label==1);
figure,imshow(im1);

figure,imshow(label==6);

for j=1:max(max(label))
    [row,col] = find(label==j);
    len=max(row)-min(row)+2;
    breadth=max(col)-min(col)+2;
    target=uint8(zeros([len breadth]));
    sy=min(col)-1;
    sx=min(row)-1;
    
    for i=1:size(row,1)%the (row,1) can be written like (row)
        x=row(i,1)-sx;
        y=col(i,1)-sy;
        target(x,y)=A(row(i,1),col(i,1));
    end
    mytitle=strcat('Object Number:',num2str(j));
    figure,imshow(target);title(mytitle);
end