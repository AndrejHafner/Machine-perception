function [out_ro, out_theta] = hough_find_lines(Ie, bins_rho, bins_theta, threshold,max_lines)
    %theta - angle
    %rho - distance from the origin
    [h,w] = size(Ie);
    D = sqrt(h^2 + w^2); % length of the diagonal of image
    val_theta = (linspace(-90, 90, bins_theta) / 180) * pi; % values of theta re known
    val_rho = linspace(-D, D, bins_rho); % values of rho
    A = zeros(bins_rho,bins_theta);
    
    % Get x an y's of the values that are edges 
    [row_indices,col_indices] = find(Ie > 0);
    
    % Create the accumulator array
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
    figure;
    imagesc(A);
    % Only keep the local maxima
    A = nonmaxima_suppression_box(A);
    
    % Retrieve bins and their indices that are higher than the threshold
    threshold_mask = A > threshold;
    [rho_idx,theta_idx,bin_values] = find(A .* threshold_mask);
    
    % Get the top candidates for lines
    candidates = sortrows([rho_idx,theta_idx,bin_values],3,'descend');
    
    [h,~] = size(candidates);
    
    if h > max_lines
        candidates = candidates(1:max_lines,:);
    end
    
    
    out_ro = arrayfun(@(x) val_rho(x) ,candidates(:,1));
    out_theta = arrayfun(@(x) val_theta(x) ,candidates(:,2));
    