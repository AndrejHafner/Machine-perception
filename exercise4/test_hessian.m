close all;
A = double(rgb2gray(imread('pier.jpg')));

A_hess = hessian_points(A,2);

imshow(A_hess);