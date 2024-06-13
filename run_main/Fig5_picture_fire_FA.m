%%
clear;clc;close all
parentFolder = fullfile(pwd, '..'); % 获取当前目录的上级目录
allFolders = genpath(parentFolder); % 生成上级目录及其所有子目录的路径
addpath(allFolders); % 将这些路径加入到MATLAB的搜索路径中
fosize=16;
wind=4.7;
bwd=0.5;%条形图宽度
rng(10000)
nsample=20000;  %计算表3、表4的样本量
% nsample=1000000;  %画图样本量
nvar=4;
xmean=[25 20 wind 4];    % mean
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
a=[];b=[];c=[];d=[];
m=WS<5;
n=not(m);
R(m)=30.*mf(m);
R(n)=(30+1.531.*(WS(n)-5).^0.858.*fhss(n).^0.93.*(fhsns(n).*hns(n)).^0.637.*1.03).*mf(n);
g1=R;
h1=histogram(g1,'BinWidth',bwd);
hold on;
L1 = length(h1.BinEdges);
for i = 1:L1-1
    x1(i) = (h1.BinEdges(i) + h1.BinEdges(i+1))/2;
end
y1 = h1.Values/nsample/h1.BinWidth;

rng(10000)
nvar=4;
z=latin_hs(xmean,xsd,nsample,nvar);
WD=z(:,1)';
RH=z(:,2)';
WS=z(:,3)';
FA=z(:,4)';
FA=2.4*ones(1,nsample);
mc=2.76+0.124*RH-0.0187*WD;
mf=18.53.*mc.^(-1.495);
fhss=3.39*(1-exp(-0.03*FA*12));
fhsns=2.5*(1-exp(-0.22*FA*12));
hns=23.33*(1-exp(-0.025*FA*12));
m=WS<5;
n=not(m);
R(m)=30.*mf(m);
R(n)=(30+1.531.*(WS(n)-5).^0.858.*fhss(n).^0.93.*(fhsns(n).*hns(n)).^0.637.*1.03).*mf(n);
g2=R;
h2=histogram(g2,'BinWidth',bwd);
L2 = length(h2.BinEdges);
for i = 1:L2-1
    x2(i) = (h2.BinEdges(i) + h2.BinEdges(i+1))/2;
end
y2 = h2.Values/nsample/h2.BinWidth;

rng(10000)
nvar=4;
z=latin_hs(xmean,xsd,nsample,nvar);
WD=z(:,1)';
RH=z(:,2)';
WS=z(:,3)';
FA=z(:,4)';
FA=3.2*ones(1,nsample);
mc=2.76+0.124*RH-0.0187*WD;
mf=18.53.*mc.^(-1.495);
fhss=3.39*(1-exp(-0.03*FA*12));
fhsns=2.5*(1-exp(-0.22*FA*12));
hns=23.33*(1-exp(-0.025*FA*12));
a=[];b=[];c=[];d=[];
m=WS<5;
n=not(m);
R(m)=30.*mf(m);
R(n)=(30+1.531.*(WS(n)-5).^0.858.*fhss(n).^0.93.*(fhsns(n).*hns(n)).^0.637.*1.03).*mf(n);
g3=R;
h3=histogram(g3,'BinWidth',bwd);
L3 = length(h3.BinEdges);
for i = 1:L3-1
    x3(i) = (h3.BinEdges(i) + h3.BinEdges(i+1))/2;
end
y3 = h3.Values/nsample/h3.BinWidth;

rng(10000)
nvar=4;
z=latin_hs(xmean,xsd,nsample,nvar);
WD=z(:,1)';
RH=z(:,2)';
WS=z(:,3)';
FA=z(:,4)';
FA=4*ones(1,nsample);
mc=2.76+0.124*RH-0.0187*WD;
mf=18.53.*mc.^(-1.495);
fhss=3.39*(1-exp(-0.03*FA*12));
fhsns=2.5*(1-exp(-0.22*FA*12));
hns=23.33*(1-exp(-0.025*FA*12));
a=[];b=[];c=[];d=[];
m=WS<5;
n=not(m);
R(m)=30.*mf(m);
R(n)=(30+1.531.*(WS(n)-5).^0.858.*fhss(n).^0.93.*(fhsns(n).*hns(n)).^0.637.*1.03).*mf(n);
g4=R;
h4=histogram(g4,'BinWidth',bwd);
L4 = length(h4.BinEdges);
for i = 1:L4-1
    x4(i) = (h4.BinEdges(i) + h4.BinEdges(i+1))/2;
end
y4 = h4.Values/nsample/h4.BinWidth;

rng(10000)
nvar=4;
z=latin_hs(xmean,xsd,nsample,nvar);
WD=z(:,1)';
RH=z(:,2)';
WS=z(:,3)';
FA=z(:,4)';
FA=4.8*ones(1,nsample);
mc=2.76+0.124*RH-0.0187*WD;
mf=18.53.*mc.^(-1.495);
fhss=3.39*(1-exp(-0.03*FA*12));
fhsns=2.5*(1-exp(-0.22*FA*12));
hns=23.33*(1-exp(-0.025*FA*12));
a=[];b=[];c=[];d=[];
m=WS<5;
n=not(m);
R(m)=30.*mf(m);
R(n)=(30+1.531.*(WS(n)-5).^0.858.*fhss(n).^0.93.*(fhsns(n).*hns(n)).^0.637.*1.03).*mf(n);
g5=R;
h5=histogram(g5,'BinWidth',bwd);
L5 = length(h5.BinEdges);
for i = 1:L5-1
    x5(i) = (h5.BinEdges(i) + h5.BinEdges(i+1))/2;
end
y5 = h5.Values/nsample/h5.BinWidth;

rng(10000)
nvar=4;
z=latin_hs(xmean,xsd,nsample,nvar);
WD=z(:,1)';
RH=z(:,2)';
WS=z(:,3)';
FA=z(:,4)';
FA=5.6*ones(1,nsample);
mc=2.76+0.124*RH-0.0187*WD;
mf=18.53.*mc.^(-1.495);
fhss=3.39*(1-exp(-0.03*FA*12));
fhsns=2.5*(1-exp(-0.22*FA*12));
hns=23.33*(1-exp(-0.025*FA*12));
a=[];b=[];c=[];d=[];
m=WS<5;
n=not(m);
R(m)=30.*mf(m);
R(n)=(30+1.531.*(WS(n)-5).^0.858.*fhss(n).^0.93.*(fhsns(n).*hns(n)).^0.637.*1.03).*mf(n);
g6=R;
h6=histogram(g6,'BinWidth',bwd);
L6 = length(h6.BinEdges);
for i = 1:L6-1
    x6(i) = (h6.BinEdges(i) + h6.BinEdges(i+1))/2;
end
y6 = h6.Values/nsample/h6.BinWidth;

figure
ggThemePlot(gca,'pale');
plot(x1,y1,'-','color',[0 114 189]/255,'linewidth',2)
hold on;
plot(x2,y2,'-','color',[255 127 39]/255,'linewidth',2)
plot(x3,y3,'-','color',[126 47 142]/255,'linewidth',2)
plot(x4,y4,'-','color',[198 0 0]/255,'linewidth',2)
plot(x5,y5,'-','color',[119 172 48]/255,'linewidth',2)
plot(x6,y6,'-','color',[128 128 128]/255,'linewidth',2)


leg=legend('Original PDF','PDF fixing \itFA\rm\bf=2.4','PDF fixing \itFA\rm\bf=3.2','PDF fixing \itFA\rm\bf=4','PDF fixing \itFA\rm\bf=4.8','PDF fixing \itFA\rm\bf=5.6');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('\itR','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
xlim([0,150])
% 
%     ylim([0 0.35]);

scatterSep='on'; % 是否分开绘制竖线散点
%% 
figure
ggThemePlot(gca,'pale');
T=1/nsample:1/nsample:1;
plot(sort(g1),T,'color',[0 114 189]/255,'linewidth',2)
hold on;
plot(sort(g2),T,'color',[255 127 39]/255,'linewidth',2)
plot(sort(g3),T,'color',[126 47 142]/255,'linewidth',2)
plot(sort(g4),T,'color',[198 0 0]/255,'linewidth',2)
plot(sort(g5),T,'color',[119 172 48]/255,'linewidth',2)
plot(sort(g6),T,'color',[128 128 128]/255,'linewidth',2)
leg=legend('Original CDF','CDF fixing \itFA\rm\bf=2.4','CDF fixing \itFA\rm\bf=3.2','CDF fixing \itFA\rm\bf=4','CDF fixing \itFA\rm\bf=4.8','CDF fixing \itFA\rm\bf=5.6');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('\itR','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
%% 
V1=var(g1);
V2=var(g2);
V3=var(g3);
V4=var(g4);
V5=var(g5);
V6=var(g6);
E1=shannon_entropy(g1);
E2=shannon_entropy(g2);
E3=shannon_entropy(g3);
E4=shannon_entropy(g4);
E5=shannon_entropy(g5);
E6=shannon_entropy(g6);