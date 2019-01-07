function dual_pca_demo()
 
figure(1); clf;
P = load('points.txt');

% Compute direct PCA
mean_val = sum(P,2) / size(P,2);

% Center data
P_centered = P - mean_val;
size(P,1)
% Compute covariance matrix
P_cov = (1 / (size(P,1) - 1)) * (P_centered' * P_centered);

% Compute SVD
[U_d,S_d,~] = svd(P_cov);
U = P_centered * U_d * (((size(P,1)-1)*S_d) ^(-1/2));

P_PCA = U' * (P_centered);

P_after = U*P_PCA + mean_val


