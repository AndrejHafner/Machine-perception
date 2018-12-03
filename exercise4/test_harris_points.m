close all;

B = rgb2gray(imread('graf/graf1.png'));
A = double(B);
colormap gray;
[px,py] = harris_points(A,6,10000);
colormap gray;

imagesc(A);
figure;

B = insertMarker(B,[px,py],'x','color','red','size',5);
imshow(B);

