close all;

A = double(imread('newyork/newyork1.png'));
B = double(imread('newyork/newyork2.png'));

A1 = double(rgb2gray(imread('graf/graf1.png')));
B1 = double(rgb2gray(imread('graf/graf2.png')));

keypoints = load('newyork/newyork.txt');
keypoints1 = load('graf/graf.txt');

% Get matches
M = find_matches(A,B);
M = sortrows(M,5);

% Get the 10 best matches (smallest Hellinger distance)
if(size(M,1) > 10)
    M = M(1:10,1:4);
else
    M = M(:,1:4);
end

displaymatches(A,M(:,1),M(:,2),B,M(:,3),M(:,4));

H = estimate_homography(keypoints(:,1),keypoints(:,2),keypoints(:,3),keypoints(:,4));
H1 = estimate_homography(keypoints1(:,1),keypoints1(:,2),keypoints1(:,3),keypoints1(:,4));
H2 = estimate_homography(M(:,1),M(:,2),M(:,3),M(:,4));

AT = transform_homography(A,H);
A1T = transform_homography(A1,H1);
AMT = transform_homography(A,H2);


figure;

subplot(1,3,1);
imshow(uint8(A));
title('A original');

subplot(1,3,2);
imshow(uint8(AT));
title('A transformed');

subplot(1,3,3);
imshow(uint8(B));
title('B original');

figure;

subplot(1,3,1);
imshow(uint8(A1));
title('A1 original');

subplot(1,3,2);
imshow(uint8(A1T));
title('A1 transformed');

subplot(1,3,3);
imshow(uint8(B1));
title('B1 original');

figure;

subplot(1,3,1);
imshow(uint8(A));
title('A original');

subplot(1,3,2);
imshow(uint8(AMT));
title('A transformed - myalg');

subplot(1,3,3);
imshow(uint8(B));
title('B original');