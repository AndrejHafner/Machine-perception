close all;

A = preprocess_image_series(1);

[U,mean_val] = dual_pca(A);

for i = 1:5
    img = reshape(U(:,i),[96,84]);
    subplot(1,5,i);
    colormap gray;
    imagesc(img);
end

B = double(imread('faces/1/001.png'));

B_res = reshape(B,[84*96,1]);

B_proj = U' * (B_res - mean_val);
B_after = reshape(U*B_proj + mean_val,[96,84]);

figure;

subplot(3,3,1);
imagesc(B);
title('original');

subplot(3,3,2);
imagesc(B_after);
title('reprojected');

subplot(3,3,3);
colormap gray;
imagesc(B_after - B);
title('difference');

B_res_2 = reshape(B,[84*96,1]);
B_res_2(4074,:) = 0;
B_proj_2 = U' * (B_res_2 - mean_val);
B_after_2 = reshape(U*B_proj_2 + mean_val,[96,84]);

subplot(3,3,4);
imagesc(B);
title('original ');

subplot(3,3,5);
imagesc(reshape(B_res_2,[96,84]));
title('original - pixel set to 0');

subplot(3,3,6);
colormap gray;
imagesc(B_after_2);
title('reprojected');

B_proj_3 = U' * (B_res - mean_val);
B_proj_3(4,:) = 0;
B_after_3 = reshape(U*B_proj_3 + mean_val,[96,84]);


subplot(3,3,7);
imagesc(B);
title('original ');

subplot(3,3,8);
imagesc(reshape(B_res_2,[96,84]));
title('original in PCA - pixel set to 0');

subplot(3,3,9);
colormap gray;
imagesc(B_after_3);
title('reprojected');
