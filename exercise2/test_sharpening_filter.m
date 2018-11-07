close all;
A = rgb2gray(imread('museum.jpg'));
subplot(1,2,1);
imshow(A);

ker = [-1/3,5/3,-1/3];
A_conv = conv2(double(A),ker,'same');
subplot(1,2,2);
imshow(uint8(conv2(A_conv,ker','same')));