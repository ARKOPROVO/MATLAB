temp= zeros(9,9);
I=imread('Alphabets.png');
[m,n]= size(I);
figure,imshow(I);
if size(I,3)==3 % RGB image
 I=rgb2gray(I);
 title('Input image in GrayScale')
end
figure,imshow(I);
E = edge(I);
figure,imshow(E); 
for i = 1 : m
    for j = 1 : n
        if(E(i,j)==1)
            x=i-4;
            y=j-4;
            for k= 1 : 9
                for l = 1 : 9
                    if(x>=1 && x<=m && y>=1 && y<=n)
                        temp(k,l) = I(x,y);
                        y=y+1;
                    
                    else
                        temp(k,l)=0;
                        y=y+1;
                    end
                end
                x=x+1;
            end
            image(temp);
            temp=im2bw(temp);
            figure,image(temp)
        end
    end
end

