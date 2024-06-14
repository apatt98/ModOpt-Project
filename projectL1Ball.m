function y = projectL1Ball(x, t)
% Check if x is already within the l1 ball of radius t
    if norm(x, 1) <= t
        y = x;
        return;
    else
% Sort x in descending order
        x_sort = sort(abs(x), 'descend');
% Determine the cumulative sum of x_sort
        sv = cumsum(x_sort);
% Determine highest index such that inequality holds
        rho = find(x_sort - (1 ./ linspace(1,size(x,2),size(x,2))).*(sv-t)> 0,1,'last'); 

        theta = (sv(rho) - t) / rho;
% Determine projection
        y = sign(x) .* max(abs(x) - theta, 0);
    end
end