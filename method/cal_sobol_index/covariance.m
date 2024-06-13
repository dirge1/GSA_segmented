function D=covariance(b,c)
for i=1:length(b)
    for j=i:length(b)
        D(i,j)=c(i,j)*b(i)*b(j);
        D(j,i)=c(i,j)*b(i)*b(j);
    end
end