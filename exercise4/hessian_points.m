function I_hess = hessian_points(I,sigma)

I = imgaussfilt(I,sigma);
[dX,dY] = gradient(I);
[ddX,ddXY] = gradient(dX);
[ddY,~] = gradient(dY);
I_hess = (sigma^4)*(ddX.*ddY - (ddXY).^2);
