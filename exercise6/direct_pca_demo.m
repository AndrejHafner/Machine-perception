function direct_pca_demo()
 
figure(1); clf;
P = load('points.txt');
q = [3;6];

subplot(1,2,1);
plot(P(1,:),P(2,:),'+');
plot(q(1),q(2),'b+');
hold on;

euc_dist = [];
for i = 1 : size(P,2)
   text( P(1,i)-0.5, P(2,i), num2str(i)); 
   euc_dist = [euc_dist, sqrt(sum((q - P(:,i)).^2))];
end
[min_dist_before,idx] = min(euc_dist)
xlabel('x_1'); ylabel('x_2');
xlim([-10 10]);
ylim([-10 10]);

% Compute direct PCA
mean_val = sum(P,2) / size(P,2);

% Center data
P_centered = P - mean_val;

% Compute covariance matrix
P_cov = (1 / (size(P,2) - 1)) * (P_centered * P_centered');

% Compute SVD
[U,S,~] = svd(P_cov)
U(:,1) = U(:,1) * S(1,1);
U(:,2) = U(:,2) * S(2,2);

plot([0,U(1,1)] + mean_val(1),[0,U(2,1)]+ mean_val(2),'r')
plot([0,U(1,2)] + mean_val(1),[0,U(2,2)]+ mean_val(2),'g')
draw_gauss2d(mean_val,P_cov,'r',1);

U(:,1) = U(:,1) / S(1,1);
U(:,2) = U(:,2) / S(2,2);

P_PCA = U' * P_centered;
q_centered = q - mean_val;
q_PCA = U' * q_centered;

U(:,2) = 0;

P_after = U * P_PCA + mean_val;
q_after = U * q_PCA + mean_val;
plot(q_after(1),q_after(2),'+');


plot(P_after(1,:),P_after(2,:),'*');
draw_reconstructions(P,P_after);
draw_reconstructions(q,q_after);


euc_dist_after = [];
for i = 1 : size(P,2)
   euc_dist_after = [euc_dist_after, sqrt(sum((q_after - P_after(:,i)).^2))];
end
[min_dist_after,idx_after] = min(euc_dist_after)

subplot(1,2,2);

S_sum = sum(S);
cumulative_percentage = cumsum(S_sum)/sum(S_sum);
bar(cumulative_percentage) % 84% of reconstruction information


