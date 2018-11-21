close all;

A = rgb2gray(imread('museum.jpg'));

colormap gray;

imshow(findedges(A,1,16));