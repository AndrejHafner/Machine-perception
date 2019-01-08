close all;
colormap gray;
A = preprocess_image_series(2);

A_avg = mean(A,2);

%imagesc(reshape(A_avg,[96,84]));
[U,mean_val] = dual_pca(A);
subplot(1,2,1);
colormap gray;
imagesc(A_avg);
scale = 30;
for x = linspace(-200,200,1200)
    A_proj = U' * (A_avg - mean_val);
    A_proj(2,:) = A_proj(2,:) + x * sin(x) * scale ;
    A_proj(3,:) = A_proj(3,:) + x * cos(x) * scale ;
    A_after = U*A_proj + mean_val;
    %subplot(1,2,2);
    figure(2);
    colormap gray;
    imagesc(reshape(A_after,[96,84]));
    title(num2str(x));
    pause(0.03);
end



