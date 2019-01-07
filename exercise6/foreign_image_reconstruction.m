close all;
colormap gray;
A = preprocess_image_series(1);
[U,mean_val] = dual_pca(A);

B = double(rgb2gray(imread('elephant.jpg')));
size(B)
B_res = reshape(B,[84*96,1]);

B_proj = U' * (B_res - mean_val);
B_after = U * B_proj + mean_val;

imagesc(reshape(B_after,[96,84]));
