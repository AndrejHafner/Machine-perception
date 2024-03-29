function [x1in,x2in] = get_inliers(F,x1,x2,eps)
    x1in = [];
    x2in = [];
    
    for i = 1:size(x1,1)
       l1 = F' * [x2(i,1),x2(i,2),1]';
       l2 = F * [x1(i,1),x1(i,2),1]';
       dist1 = abs(l1(1) * x1(i,1) + l1(2) * x1(i,2) + l1(3)) / sqrt(l1(1)^2 + l1(2)^2);
       dist2 = abs(l2(1) * x2(i,1) + l2(2) * x2(i,2) + l2(3)) / sqrt(l2(1)^2 + l2(2)^2);
       if(dist1 < eps )
           x1in = [x1in; x1(i,:)];
           x2in = [x2in; x2(i,:)];
       end
       
       if(dist2 < eps)
           x1in = [x1in; x1(i,:)];
           x2in = [x2in; x2(i,:)];
       end
    end