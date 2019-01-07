close all;
clear;
colormap gray;
images_1 = preprocess_image_series(1);
images_2 = preprocess_image_series(2);
images_3 = preprocess_image_series(3);

c = 3;
n = 64;

% Compute the PCA of the images and project them to 2D subspace
[U_1,mean_val_1] = dual_pca(images_1);
[U_2,mean_val_2] = dual_pca(images_2);
[U_3,mean_val_3] = dual_pca(images_3);

% Visualize them
subplot(1,2,1);

for i = 1:n
    img1 = U_1(:,1:2)' * (double(images_1(:,i)) - mean_val_1) ;
    plot(img1(1,:),img1(2,:),'g+');hold on;
    img2 = U_2(:,1:2)' * (double(images_2(:,i)) - mean_val_2) ;
    plot(img2(1,:),img2(2,:),'rx');hold on;
    img3 = U_3(:,1:2)' * (double(images_3(:,i)) - mean_val_3) ;
    plot(img3(1,:),img3(2,:),'b*');hold on;
end

% Compute the LDA

X = double([images_1,images_2,images_3]); % all image samples next to eachother
MM = mean(X,2); % overall mean

A = X - repmat(MM,1,64*3); % subtract the mean value from the images

L = A' * A; % Surrogate of the covariance matrix
[eiVec, eiVal] = eig(L);

L_eig_vec = [];
for i = 1:(64*3 - 3)
    L_eig_vec = [L_eig_vec eiVec(:,i)];
end

V_PCA = A * L_eig_vec;

images_PCA = [];
for i = 1:(64*3)
    tmp = V_PCA' * A(:,i);
    images_PCA = [images_PCA tmp]; 
end


X = images_PCA;
MM = mean(X,2); % overall mean


SB = 0;
SW = 0;


for i = 1:c
    Ms(:,i) = mean(X(:,(i-1)*n+1:i*n),2); % class means
    SB = SB + n * (Ms(:,i) - MM) * (Ms(:,i) - MM)'; % between class scatter matrix
    for j = 1:n % within class scatter matrix
        SW = SW + (X(:,(i-1) * n + j) - Ms(:,i)) * (X(:,(i-1) * n + j) - Ms(:,i))';
    end
end

% Find a non degenerated subspace

% Solution of a generalized eigenproblem
[W,EIGD] = eigs(inv(SW) * SB,c-1,'LM'); % W are LDA subspace vectors
save('W_lda.mat','W');
Ms = W' * Ms; % class means in LDA subspace

% Show the solution in 2D
subplot(1,2,2);

for i = 1:n
    img1 = W(:,1:2)' * (double(images_1(:,i)) - mean_val_1) ;
    plot(img1(1,:),img1(2,:),'g+');hold on;
    img2 = W(:,1:2)' * (double(images_2(:,i)) - mean_val_2) ;
    plot(img2(1,:),img2(2,:),'rx');hold on;
    img3 = W(:,1:2)' * (double(images_3(:,i)) - mean_val_3) ;
    plot(img3(1,:),img3(2,:),'b*');hold on;
end








