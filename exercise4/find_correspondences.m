function [indices,distances] = find_correspondences(D1,D2)
    
    [h_d1,~] = size(D1);
    [h_d2,~] = size(D2);
    indices = zeros(h_d1,1);
    distances = zeros(h_d1,1);
    
    % Compare a point in first image to all the points in the second
    for i = 1:h_d1
        % Store all the computed values to later find the minimum
        distances = zeros(1,h_d2);
        for j = 1:h_d2
            distances(1,j) = compare_histograms(D1(i,:),D2(j,:),'hellinger');
        end
        [val,idx] = min(distances);
        indices(i,:) = idx;
        distances(i,:) = val;
        
    end