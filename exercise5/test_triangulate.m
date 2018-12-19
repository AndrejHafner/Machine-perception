close all;
house_points = load('epipolar/house_points.txt');
cam_cab_left = load('epipolar/house1_camera.txt');
cam_cab_right = load('epipolar/house2_camera.txt');

hleft = rgb2gray(imread('epipolar/house1.jpg'));
hright = rgb2gray(imread('epipolar/house2.jpg'));

x1 = house_points(:,1:2)';
x1(3,:) = 1;

x2 = house_points(:,3:4)';
x2(3,:) = 1;

X = triangulate(x1,x2,cam_cab_left,cam_cab_right)


subplot(1,3,1);
imshow(hleft);
hold on
plot(house_points(:,1),house_points(:,2),'r+');
subplot(1,3,2);
[h,w] = size(hright);
imshow(hright);
hold on
plot(house_points(:,3),house_points(:,4),'r+');

subplot(1,3,3);
plot3(X(1,:),X(3,:),X(2,:), 'ro');


