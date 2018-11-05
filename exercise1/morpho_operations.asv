close all;

% a)
M = logical(imread('mask.png'));
%SE = ones(3); % structuring element
%SE = ones(5);
%SE = [0,1,0;
%      1,1,1;
%      0,1,0]; % starts removing the edges
SE = [0,0,1,0,0;
      0,1,1,1,0;
      1,1,1,1,1;
      0,1,1,1,0;
      0,0,1,0,0]; % removes the edges even more
figure;
subplot(1,6,1);
imagesc(M); axis equal; axis tight; title('Original');
subplot(1,6,2);
imagesc(imerode(M,SE)); axis equal; axis tight; title('Erode');
subplot(1,6,3);
imagesc(imdilate(M,SE)); axis equal; axis tight; title('Dilate');
subplot(1,6,4);
imagesc(imerode(imdilate(M,SE),SE)); axis equal; axis tight; title('Dilate then Erode');
subplot(1,6,5);
imagesc(imdilate(imerode(M,SE),SE)); axis equal; axis tight; title('Erode then Dilate');

% b)
A = imread('bird.jpg');
A_gray = rgb2gray(A);
thresh = otsu(A_gray);
A_thresh = A_gray > thresh;
SE2 = ones(18);

% Closing
A_thresh = imerode(imdilate(A_thresh,SE2),SE2);
figure; imagesc(A_thresh);
colormap gray


