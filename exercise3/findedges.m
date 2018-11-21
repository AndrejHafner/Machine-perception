function [Ie,Idir] = findedges(I,sigma,theta)
    [Imag,Idir] = gradient_magnitude(I,sigma);
    Imax = nonmaxima_suppression_line(Imag,Idir);
    Ie = Imax >= theta;