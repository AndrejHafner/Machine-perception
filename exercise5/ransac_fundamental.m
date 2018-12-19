function [Fout,e1out,e2out,x1out,x2out] = ransac_fundamental(x1,x2,eps,k)

inliers_max = 0;
for i = 1:k
    % Select point matches
    indices = randperm(size(x1,2),8);
    [F,e1,e2] = fundamental_matrix(x1(:,indices)',x2(:,indices)');
    [x1in,x2in] = get_inliers(F,x1',x2',eps);
    if(size(x1in,1) > inliers_max)
        inliers_max = size(x1in,1);
        x1out = x1in;
        x2out = x2in;
        Fout = F;
        e1out = e1;
        e2out = e2;
    end
    
end