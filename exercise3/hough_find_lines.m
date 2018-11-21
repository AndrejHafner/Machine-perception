function [out_ro, out_theta] = hough_find_lines(Ie, bins_rho, bins_theta, threshold)
    %theta - angle
    %rho - distance from the origin
    [h,w] = size(Ie);
    D = sqrt(h^2 + w^2); % length of the diagonal of image
    val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % values of theta re known
    val_rho = linspace(-D, D, bins_rho); % values of rho
    A = zeros(bins_rho,bins_theta);
    
    %img = findedges(rgb2gray(Ie),1,16);
    [row_indices,col_indices] = find(Ie > 0);
    
    for i = 1:length(row_indices)
        x = row_indices(i);
        y = col_indices(i);
       
        rho = x * cos(val_theta) + y * sin(val_theta); 
        bin_rho = round(((rho + D) / (2 * D)) * length(val_rho)); % 
        for j = 1:bins_theta 
            if bin_rho(j) > 0 && bin_rho(j) <= bins_rho
                A(bin_rho(j), j) = A(bin_rho(j), j) + 1;
            end
        end
    end
    imagesc(A);