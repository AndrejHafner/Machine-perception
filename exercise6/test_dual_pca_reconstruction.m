close all;

A = preprocess_image_series(2);

[U,mean_val] = dual_pca(A);

B = double(imread('faces/2/024.png'));

Beg = U(:,1:2)' * (B_res - mean_val)
size(Beg)

B_res = reshape(B,[84*96,1]);

retain = 32;
for i = 1:6
    B_proj = U' * (B_res - mean_val);
    U_new = U;
    U_new(:,retain:end) = 0;
    B_after = reshape(U_new*B_proj + mean_val,[96,84]);
    subplot(1,6,i);
    colormap gray;
    imagesc(B_after);
    title(['vectors retained: ' num2str(retain) ]);
    retain = retain / 2;
end
