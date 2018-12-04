close all;

A = double(rgb2gray(imread('graf/graf1_small.png')));
B = double(rgb2gray(imread('graf/graf2_small.png')));

M = find_matches(A,B);
displaymatches(A,M(:,1),M(:,2),B,M(:,3),M(:,4));
