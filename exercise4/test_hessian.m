close all;
B = rgb2gray(imread('graf/graf1.png'));
A = double(B);
[px,py,A_hess] = hessian_points(A,3,25000);
colormap gray;
imagesc(A);
figure;
B = insertMarker(B,[px,py],'x','color','red','size',5);
imshow(B);
figure;
imagesc(A_hess);