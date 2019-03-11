%% Read Image
Inputimage=imread('BengText.png');
%% Show image
figure(1)
imshow(Inputimage);
title('INPUT IMAGE WITH NOISE')
%% Convert to gray scale
if size(Inputimage,3)==3 % RGB image
 Inputimage=rgb2gray(Inputimage);
 title('Input image in GrayScale')
end
%% Convert to binary image
threshold = graythresh(Inputimage);
Inputimage =~im2bw(Inputimage,threshold);
title('Input image in Binary')
%% Remove all object containing fewer than 30 pixels
Inputimage = bwareaopen(Inputimage,30);
pause(1);
%% Label connected components
[L Ne]=bwlabel(Inputimage);
propied=regionprops(L,'BoundingBox');
imshow(~Inputimage);
hold on
for n=1:size(propied,1)
  rectangle('Position',propied(n).BoundingBox,'EdgeColor','g','LineWidth',1)
end
hold off
pause (1);
%% Objects extraction
figure
for n=1:Ne
    
  [r,c] = find(L==n);
  n1=Inputimage(min(r):max(r),min(c):max(c));
  imshow(~n1);
  %%testing hough on each component
  I=edge(~n1,'Canny');
figure,imshow(I);
[H,T,R]=hough(I);
figure,imshow(H)

P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','white');

lines = houghlines(I,T,R,P,'FillGap',5,'MinLength',7);
figure, imshow(I), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

  figure,plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','cyan');
  pause(0.5)
end