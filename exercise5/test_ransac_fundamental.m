close all;

points = load('epipolar/house_matches.txt');
hleft = rgb2gray(imread('epipolar/house1.jpg'));
hright = rgb2gray(imread('epipolar/house2.jpg'));

x1 = [points(:,1),points(:,2)]';
x1(3,:) = 1;
x2 = [points(:,3),points(:,4)]';
x2(3,:) = 1;
[F,e1,e2,x1out,x2out] = ransac_fundamental(x1,x2,25,1000);


p1 = x1out(1,:);
p1r = x2out(1,:);
l1 = F * p1';


subplot(1,2,1);
imshow(hleft);
hold on


plot(points(:,1),points(:,2),'r+');
plot(x1out(:,1),x1out(:,2),'b+');
plot(p1(1),p1(2),'g+');
subplot(1,2,2);
[h,w] = size(hright);
imshow(hright);
hold on
draw_line(l1,w,h,'green');


plot(points(:,3),points(:,4),'r+');
plot(x2out(:,1),x2out(:,2),'b+');

plot(p1r(1),p1r(2),'g+');