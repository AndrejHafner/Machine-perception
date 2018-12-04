function M = find_matches(A,B)

    sigma = 6;
    thresh = 7000;
    m = 41;
    bins = 16;

    [pxA,pyA,~] = hessian_points(A,3,20000);
    [pxB,pyB,~] = hessian_points(B,3,20000);
    
    %[pxA,pyA] = harris_points(A,sigma,thresh);
    %[pxB,pyB] = harris_points(B,sigma,thresh);

    descA = descriptors_maglap(A,pxA,pyA,m,1,bins);
    descB = descriptors_maglap(B,pxB,pyB,m,1,bins);

    [indices1,distances1] = find_correspondences(descA,descB);
    [indices2,~] = find_correspondences(descB,descA);
    
    M = [];
    
    for i = 1:length(indices1)
        if(i == indices2(indices1(i)))
            row = [pxA(i),pyA(i),pxB(indices1(i)),pyB(indices1(i)),distances1(i)];
            M = [M ; row];
        end
        
    end

