close all;
colormap gray;
A = preprocess_image_series(2);

A_avg = mean(A,2);

%imagesc(reshape(A_avg,[96,84]));
[U,mean_val] = dual_pca(A);
subplot(1,2,1);
imagesc(A_avg);

for x = linspace(-20,20,500)
    A_proj = U' * (A_avg - mean_val);
    A_proj(2,:) =  x * sin(x);
    A_proj(3,:) =  x * cos(x);
    A_after = U*A_proj + mean_val;
    %subplot(1,2,2);
    figure(2);
    imagesc((A_after));
    title(num2str(x));
    pause(0.1);
end



