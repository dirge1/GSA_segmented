grandparentFolder = fullfile(pwd, '..', '..'); % 获取当前目录的上级的上级目录
allFolders = genpath(grandparentFolder); % 生成上级的上级目录及其所有子目录的路径
addpath(allFolders); % 将这些路径加入到MATLAB的搜索路径中
%% PAWN index
clear;clc;close all
miu_U=2:0.1:8;
nsample=200000;
nvar=4;
for k=1:length(miu_U)
    R=[];WD=[];RH=[];WS=[];FA=[];z=[];
    xmean=[25 20 miu_U(k) 4];    % mean
    xsd=[4 2 0.5 0.8];
    z=latin_hs(xmean,xsd,nsample,nvar);
    WD=z(:,1)';
    RH=z(:,2)';
    WS=z(:,3)';
    FA=z(:,4)';
    mc=2.76+0.124*RH-0.0187*WD;
    mf=18.53.*mc.^(-1.495);
    fhss=3.39*(1-exp(-0.03*FA*12));
    fhsns=2.5*(1-exp(-0.22*FA*12));
    hns=23.33*(1-exp(-0.025*FA*12));
    P=WS<5;
    R(P)=30*mf(P);
    P=~P;
    R(P)=(30+1.531*(WS(P)-5).^0.858.*fhss(P).^0.93.*(fhsns(P).*hns(P)).^0.637*1.03).*mf(P);
    N=1001;
    s=1;
    i=1;
    while i<N
        i
        C=floor(rand([1,nsample])*nsample)+1;
        [~,KS_mean{k}(i,:),~,~,~,~,~,~] = pawn_indices_givendata([WD(C);RH(C);WS(C);FA(C)]',R(C)',10,1);
        if isnan(KS_mean{k}(i,1))||isnan(KS_mean{k}(i,2))||isnan(KS_mean{k}(i,3))||isnan(KS_mean{k}(i,4))
            N=N+1;
        else
            KS_mean_re{k}(s,:)=KS_mean{k}(i,:);
            s=s+1;
        end
        i=i+1;
    end
end
% save('result-fire-pawn.mat','KS_mean_re','N','nsample','tt','xsd')
%% delta index
clear;clc;
miu_U=2:0.1:8;
nsample=5000;
nvar=4;
for k=1:length(miu_U)
    R=[];WD=[];RH=[];WS=[];FA=[];z=[];
    xmean=[25 20 miu_U(k) 4];    % mean
    xsd=[4 2 0.5 0.8];
    z=latin_hs(xmean,xsd,nsample,nvar);
    WD=z(:,1)';
    RH=z(:,2)';
    WS=z(:,3)';
    FA=z(:,4)';
    mc=2.76+0.124*RH-0.0187*WD;
    mf=18.53.*mc.^(-1.495);
    fhss=3.39*(1-exp(-0.03*FA*12));
    fhsns=2.5*(1-exp(-0.22*FA*12));
    hns=23.33*(1-exp(-0.025*FA*12));
    P=WS<5;
    R(P)=30*mf(P);
    P=~P;
    R(P)=(30+1.531*(WS(P)-5).^0.858.*fhss(P).^0.93.*(fhsns(P).*hns(P)).^0.637*1.03).*mf(P);
    N=1000;
    for i=1:N
        i
        C=floor(rand([1,nsample])*nsample)+1;
        delta_measure{k}(i,:)=Borgonovo_measure([WD(C);RH(C);WS(C);FA(C)]',R(C)');
    end
end
% save('result-fire-delta.mat','delta_measure','N','nsample','xsd','tt')
%% mutual information
clear;clc;
miu_U=2:0.1:8;
nsample=2000;
nvar=4;
for k=1:length(miu_U)
    k
    R=[];WD=[];RH=[];WS=[];FA=[];z=[];
    xmean=[25 20 miu_U(k) 4];    % mean
    xsd=[4 2 0.5 0.8];
    z=latin_hs(xmean,xsd,nsample,nvar);
    WD=z(:,1)';
    RH=z(:,2)';
    WS=z(:,3)';
    FA=z(:,4)';
    mc=2.76+0.124*RH-0.0187*WD;
    mf=18.53.*mc.^(-1.495);
    fhss=3.39*(1-exp(-0.03*FA*12));
    fhsns=2.5*(1-exp(-0.22*FA*12));
    hns=23.33*(1-exp(-0.025*FA*12));
    P=WS<5;
    R(P)=30*mf(P);
    P=~P;
    R(P)=(30+1.531*(WS(P)-5).^0.858.*fhss(P).^0.93.*(fhsns(P).*hns(P)).^0.637*1.03).*mf(P);
    
    N=1000;
    for i=1:N
        U=randperm(nsample);
        U=reshape(U,10,[]);
        for j=1:size(U,1)
            train=[WD(U(j,:));RH(U(j,:));WS(U(j,:));FA(U(j,:));R(U(j,:))];%
            MI_z(j,:)=enty_measure(train,R(U(j,:)));
        end
        MI{k}(i,:)=mean(MI_z);
    end
end
% save('result-fire-MI.mat','MI','N','nsample','tt','xsd')
%% Sobol index
clear;clc;
miu_U=2:0.1:8;
k=4;
Cstart=[1 0 0 0
    0 1 0 0
    0 0 1 0
    0 0 0 1];
nsample=2000;
N=1000;
sizeB=2000;
xmean=[25 20 miu_U(k) 4];    % mean
xsd=[4 2 0.5 0.8];
[~,~,~,~,~,~,~,ST_full_re]=sensitivity(k,Cstart,nsample,xmean,xsd,N,sizeB,8,1);