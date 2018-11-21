close all;
A = rgb2gray(imread('rectangle.png'));
imshow(A);
figure;
A = findedges(A,1,20);
imshow(A);
figure;
hough_find_lines(A,300,300,5)