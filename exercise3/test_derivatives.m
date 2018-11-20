close all;

A = rgb2gray(imread('bricks.jpg'));
[Ax,Ay] = image_derivatives2(A,1);
imshow(Ax);
figure; imshow(Ay);
