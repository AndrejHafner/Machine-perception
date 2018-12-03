close all;

A = double(rgb2gray(imread('graf/graf1_small.png')));
B = double(rgb2gray(imread('graf/graf2_small.png')));

sigma = 6;
thresh = 7000;
m = 41;
bins = 16;

[pxA,pyA] = harris_points(A,sigma,thresh);
[pxB,pyB] = harris_points(B,sigma,thresh);

descA = descriptors_maglap(A,pxA,pyA,m,1,bins);
descB = descriptors_maglap(B,pxB,pyB,m,1,bins);

[indices,distances] = find_correspondences(descA,descB);
displaymatches(A,pxA,pyA,B,pxB(indices),pyB(indices));


