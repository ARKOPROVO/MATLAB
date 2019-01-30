I=imread('41.png');
figure,imshow(I);
T=graythresh(I);
BW = im2bw(I,T);
figure,imshow(BW);
results = ocr(BW)
B = averagefilter(BW);
figure,imshow(B);
B1 = niblack(B);
figure,imshow(B1);

% Display one of the recognized words
word = results.Words
%BW2 = bwpropfilt(BW,'perimeter',2);
%figure;
%imshow(BW2)
%title('Objects with the Largest Perimeters')