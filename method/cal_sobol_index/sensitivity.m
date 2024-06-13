function [S_ind,ST_ind,S_full,ST_full,S_ind_re,ST_ind_re,S_full_re,ST_full_re]=sensitivity(k,Cstart,N,a,b,B,sizeB,o,par)
sizeB=N;
C0=covariance(b,Cstart);
%Z_UNIF=rand(N,2*k);
Z_UNIF = net(sobolset(2*k,'Skip',1e3),N);
index_b_Mat=zeros(B,sizeB);
for i=1:B
    index_b_Mat(i,:) = datasample(1:N,sizeB);
end

for i= 1:k
    C=[[C0(i:k,i:k);C0(1:i-1,i:k)] [C0(i:k,1:i-1);C0(1:i-1,1:i-1)]];
    pycal=py.transformation.MvNormalTrans([a(i:k) a(1:i-1)],C,Z_UNIF(:,1:k)');
    S=pycal.trans();
    sample1=double(S)';
    WW1=[sample1(:,k-i+2:end) sample1(:,1:k-i+1)];
    y_1=fun_y(WW1,o,par);
    
    pycal=py.transformation.MvNormalTrans([a(i:k) a(1:i-1)],C,Z_UNIF(:,k+1:2*k)');
    S2=pycal.trans();
    sample2=double(S2)';
    WW2=[sample2(:,k-i+2:end) sample2(:,1:k-i+1)];
    y_2=fun_y(WW2,o,par);
    
    pycal=py.transformation.MvNormalTrans([a(i:k) a(1:i-1)],C,[Z_UNIF(:,1) Z_UNIF(:,k+2:2*k)]');
    S3=pycal.trans();
    sample3=double(S3)';
    WW3=[sample3(:,k-i+2:end) sample3(:,1:k-i+1)];
    y_3=fun_y(WW3,o,par);
    
    pycal=py.transformation.MvNormalTrans([a(i:k) a(1:i-1)],C,[Z_UNIF(:,k+1:2*k-1) Z_UNIF(:,k)]');
    S4=pycal.trans();
    sample4=double(S4)';
    WW4=[sample4(:,k-i+2:end) sample4(:,1:k-i+1)];
    y_4=fun_y(WW4,o,par);
    for bs=1:B
        index_b = index_b_Mat(bs,:);
        y_b= y_2(index_b,:);
        yp_b = y_1(index_b,:);
        y_cond_first_b =  y_3(index_b,:);
        y_cond_last_b = y_4(index_b,:);
        A=[y_b;yp_b];
        y_mean = mean(A);
        D = mean(A.^2)-y_mean.^2;
        S_full_re(i,bs) = mean(yp_b.* (y_cond_first_b-y_b))/D;
        ST_ind_re(i,bs) = mean((y_b-y_cond_last_b).^2)/2/D;
        S_ind_re(i,bs) =  mean(yp_b.* (y_cond_last_b-y_b))/D;
        ST_full_re(i,bs)= mean((y_cond_first_b-y_b).^2)/2/D;
    end
end
S_ind_re=S_ind_re([2:end 1],:);
S_ind=mean(S_ind_re,2);
ST_ind_re=ST_ind_re([2:end 1],:);
ST_ind=mean(ST_ind_re,2);

S_full=mean(S_full_re,2);
ST_full=mean(ST_full_re,2);
end