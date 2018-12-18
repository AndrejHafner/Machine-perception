% 1.b)
foc_len = 2.5; %mm
cam_baseline = 120; %mm
z = linspace(1,100);

d = (foc_len * cam_baseline) ./ z;

plot(z,d);
