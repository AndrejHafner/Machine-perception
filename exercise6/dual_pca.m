function [U,mean_val] = dual_pca(A)
    A = double(A);
    
    % Compute direct PCA
    mean_val = sum(A,2) / size(A,2);
    
    % Center data
    A_centered = A - mean_val;
    
    % Compute covariance matrix
    A_cov = (1 / (size(A,1) - 1)) * (A_centered' * A_centered);

    % Compute SVD
    [U_d,S_d,~] = svd(A_cov);
    
    % Make a numerically stable calculation
    s = diag(S_d) + 1e-15;
    Si = diag(1 ./ sqrt(s * (size(A,1)-1)));
    U = A_centered * U_d * Si;