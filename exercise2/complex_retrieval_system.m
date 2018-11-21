close all;
[histograms,files] = load_histogram_database('images',8);
distances = zeros(1,120);
dist_measures = {'l2','hellinger','chi2','intersect'};

% The dominant color is black
hist_sum = sum(histograms);

lambda = 0.05;
% Calculate the weights
weights = exp(-lambda * hist_sum);

plot(1:512,weights,1:512,hist_sum / sum(hist_sum(:)));

for i = 1:120
    histograms(i,:) = histograms(i,:) .* weights;
end

selected_hist = histograms(20,:);


for j = 1:4
    % Calculate the distances
    for i = 1:120
        distances(1,i) = compare_histograms(selected_hist,histograms(i,:),char(dist_measures(:,j)));
    end
    
    [distances_sorted,sorted_idx] = sort(distances);
    smallest_idx = sorted_idx(1:5);
    
    % Visualize the distances
    figure(j+4);clf;
    
    subplot(1,2,1);
    plot(distances,'-o','MarkerIndices',smallest_idx,'MarkerFaceColor','red');
    title(sprintf('unsorted - %s',char(dist_measures(:,j))));
    
    subplot(1,2,2);
    plot(distances_sorted,'-o','MarkerIndices',1:5,'MarkerFaceColor','red');
    title(sprintf('sorted - %s',char(dist_measures(:,j))));
    
    % Visualize the images and it's histograms
    figure(j); clf;
    for i = 1:6
        [val,idx] = min(distances);
        file = files(idx,:);
        img = imread(char(file));
        
        subplot(2,6,i);
        imshow(img);
        
        subplot(2,6,i+6);
        bar(histograms(idx,:),2,'red');
        title(sprintf("%s = %f",char(dist_measures(:,j)),val));
        
        distances(1,idx) = 1;
    end
end
