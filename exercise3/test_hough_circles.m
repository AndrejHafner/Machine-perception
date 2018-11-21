close all;
A = imread('eclipse.jpg');
A_gray = rgb2gray(A);

[B,Idir] = findedges(A_gray,1,10);
imshow(B)
figure;

radius = 46;
[x,y] = hough_find_circles(B, 180,radius, 50)
x = x - 10
hough_draw_circles(A,x,y,radius * ones(length(x)));