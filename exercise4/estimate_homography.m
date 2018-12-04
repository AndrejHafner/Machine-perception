function H = estimate_homography(px1,py1,px2,py2)
    
    % Construct matrix A
    A = [];
    for i = 1:length(px1)
        first = [px1(i), py1(i), 1, 0, 0, 0, -px2(i)*px1(i), -px2(i)*py1(i), -px2(i)];
        second = [0, 0, 0, px1(i), py1(i), 1, -py2(i)*px1(i), -py2(i)*py1(i), -py2(i)];
        combined = [first ; second];
        A = [A ; combined];
    end
    
    % Perform SVD to get the best approximate solution
    [~,~,V] = svd(A);
    % Pazi ali je V transponirana?
    
    [V_h,V_w] = size(V);
    
    % Get the vector that corresponds to the smallest eigenvalue (last one,
    % eigenvalues are ordered from largest to smallest)
    last_vec = V(:,V_w);
    
    % Get the solution
    h = last_vec' ./ last_vec(V_h);
    
    % Reshape it into H
    H = reshape(h,[3,3])';
    