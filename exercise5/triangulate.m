function X = triangulate(pts_1, pts_2, P_1, P_2)

X = [];
for i = 1:size(pts_1,2)
    a1 = cross_form(pts_1(:,i));
    a2 = cross_form(pts_2(:,i));
    c1 = a1 * P_1;
    c2 = a2 * P_2;
    A = [c1(1:2,:); c2(1:2,:)];
    [~,~,V] = svd(A);
    x = V(:,size(V,2))
    x = x / x(4,:)
    
    X = [X,x];
end