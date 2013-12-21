close all;
clear all;

n = 30;
results = zeros(1, n);

for i = 1:n
    results(i) = de;
end

mean = mean(results)
best = min(results)
worst = max(results)
std = std(results)

plot(1 : n, results);

ylabel('Fitness');
xlabel('Iteration');