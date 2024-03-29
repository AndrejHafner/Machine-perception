close all;

points = load('epipolar/house_points.txt');
p1 = [85,233,1]';
p2 = [67,219,1]';
[F,e1,e2] = fundamental_matrix(points(:,1:2)',points(:,3:4)');

error1 = reprojection_error(p1,p2,F)

sum = 0
for i = 1:size(points,1)
    sum  = sum + reprojection_error([points(i,1),points(i,2),1]',[points(i,3),points(i,4),1]',F)
end
avg_err = sum / size(points,1)