function [ ar ] = ctransform(a)
% Copula-transform array - rank and scale to [0, 1]
    [as ai] = sort(a, 2);%as�ǴӴ�С���к��a��ai���������
    [aa ar] = sort(ai, 2);%aa��1��N������ar��ʾ�ڼ�������ڵڼ���
    ar = (ar - 1) / (size(ar, 2) - 1);
end