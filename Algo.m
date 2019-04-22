temp= zeros(9,9);
I=imread('bangla.jpeg');
[m,n,c]= size(I);
figure,imshow(I);
if size(I,3)==3 % RGB image
 I=rgb2gray(I);
 title('Input image in GrayScale')
end
figure,imshow(I);
E = edge(I);
figure,imshow(E);
%n=432;
count1=zeros(m,n);
count0=zeros(m,n);
final=zeros(m,n);
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
            %image(temp);
            temp=im2bw(temp);
            %image(temp)
            for k=1:9
                for l=1:9
                    if(temp(k,l)>=1)
                        count1(i,j)=count1(i,j)+1;
                    else
                        count0(i,j)=count0(i,j)+1;
                    end
                end
            end
        end
    end
end
for i = 1 : m
    for j = 1 : n
        if(count1(i,j)>count0(i,j))
            final(i,j)=1;
        else
            final(i,j)=0;
        end
    end
end
figure,image(final);
