close all;

A = imread('bird.jpg');
A_gray = rgb2gray(A);
thresh = otsu(A_gray);
A_thresh = A_gray > thresh;
SE2 = ones(20);

% Closing
A_thresh = imerode(imdilate(A_thresh,SE2),SE2);
figure; imagesc(A_thresh);
colormap gray

A_mask = immask(A,A_thresh);
figure; imagesc(A_mask);


% Eagle
SE3 = ones(10);
E = imread('eagle.jpg');
E_gray = rgb2gray(E);
thresh = otsu(E_gray);
E_thresh = E_gray < thresh; % invert the sign because the background has lower intensity than the foreground object
E_thresh = imerode(imdilate(E_thresh,SE3),SE3);
figure; imagesc(E_thresh);
colormap gray

E_mask = immask(E,E_thresh);
figure; imagesc(E_mask);