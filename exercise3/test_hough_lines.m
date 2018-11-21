%close all;
A = imread('pier.jpg');
A_gray = rgb2gray(A);

B = findedges(A_gray,1,8);

[rhos,thetas] = hough_find_lines(B,400,400,550,20);

hough_draw_lines(A,rhos,thetas);

bricks = imread('bricks.jpg');
bricks_e = findedges(rgb2gray(bricks),2,25);
figure;
imshow(bricks_e);

%[rhos2,thetas2] = hough_find_lines(bricks_e,400,400,300,23);


%figure;
%hough_draw_lines(bricks,rhos2,thetas2);

