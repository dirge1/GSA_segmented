%% PAWN index
clear;clc;close all
miu_U=4.7;
nsample=100000:100000:2000000;
nvar=4;
for k=1:length(nsample)
    for s=1:10
R=[];WD=[];RH=[];WS=[];FA=[];z=[];
xmean=[25 20 miu_U 4];    % mean
xsd=[4 2 0.5 0.8];
z=latin_hs(xmean,xsd,nsample(k),nvar);
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
[~,KS_mean{k}(s,:),~,~,~,~,~,~] = pawn_indices_givendata([WD;RH;WS;FA]',R',10,1);
    end
end
% save('sample-fire-pawn.mat','KS_mean','nsample','miu_U')
%% delta index
clear;clc;
miu_U=4.7;
nsample=1000:1000:5000;
nvar=4;
parfor k=1:length(nsample)
        for s=1:10
R=[];WD=[];RH=[];WS=[];FA=[];z=[];
xmean=[25 20 miu_U 4];    % mean
xsd=[4 2 0.5 0.8];
z=latin_hs(xmean,xsd,nsample(k),nvar);
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
    delta_measure{k}(s,:)=Borgonovo_measure([WD;RH;WS;FA]',R');
end
end
% save('sample-fire-delta.mat','delta_measure','nsample','miu_U')
%% mutual information
clear;clc;
miu_U=4.7;
nsample=5000:1000:10000;
nvar=4;
for k=1:length(nsample)
    for s=1:10
    R=[];WD=[];RH=[];WS=[];FA=[];z=[];
    xmean=[25 20 miu_U 4];    % mean
    xsd=[4 2 0.5 0.8];
    z=latin_hs(xmean,xsd,nsample(k),nvar);
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
    
            train=[WD;RH;WS;FA;R];%
            MI{k}(s,:)=enty_measure(train,R);

    end
end
% save('sample-fire-MI.mat','MI','nsample','miu_U')
%% Sobol index
clear;clc;
miu_U=4.7;
nsample=1500:100:2000;
k=4;
Cstart=[1 0 0 0
    0 1 0 0
    0 0 1 0
    0 0 0 1];
N=10;
sizeB=2000;
xmean=[25 20 miu_U 4];    % mean
xsd=[4 2 0.5 0.8];
for s=1:length(nsample)
[~,~,~,~,~,~,~,ST_full_re{s}]=sensitivity(k,Cstart,nsample(k),xmean,xsd,N,sizeB,8,1);
end
% save('sample-fire-sobol.mat','ST_full_re','nsample','miu_U')