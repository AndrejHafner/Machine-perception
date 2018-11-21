close all;
A = imread('rectangle.png');
A_gray = rgb2gray(A);

[B,Idir] = findedges(A_gray,1,8);

[rhos,thetas] = hough_find_lines_angle(B,Idir,240,240,0,6);
figure;
hough_draw_lines(A,rhos,thetas);