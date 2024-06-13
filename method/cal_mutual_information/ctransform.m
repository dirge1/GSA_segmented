function [ ar ] = ctransform(a)
% Copula-transform array - rank and scale to [0, 1]
    [as ai] = sort(a, 2);%as是从大到小排列后的a，ai是排列序号
    [aa ar] = sort(ai, 2);%aa是1到N的数，ar表示第几大的数在第几个
    ar = (ar - 1) / (size(ar, 2) - 1);
end