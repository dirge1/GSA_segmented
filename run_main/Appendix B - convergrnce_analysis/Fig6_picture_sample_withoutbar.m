clear;clc;close all
%% 
load('sample-fire-sobol.mat','ST_full_re','nsample')
ST_re=ST_full_re;
for i=1:length(ST_re)
    ST{i}=mean(ST_re{i}');
end
fosize=16;
width=2;
figure(1)
for i=1:length(nsample)
    ST_1(i)=ST{i}(1);
    ST_2(i)=ST{i}(2);
    ST_3(i)=ST{i}(3);
    ST_4(i)=ST{i}(4);
end
ggThemePlot(gca,'pale');
plot(nsample,ST_1,'-*','color',[0 114 189]/255,'linewidth',width);
hold on;
plot(nsample,ST_2,'-*','color',[255 201 14]/255,'linewidth',width);
plot(nsample,ST_3,'-*','color',[126 47 142]/255,'linewidth',width);
plot(nsample,ST_4,'-*','color',[217 83 25]/255,'linewidth',width);
ylim([-0.05,1.1])
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('sample size','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\itS^T','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
hold off;
%% 
load('sample-fire-MI.mat','MI','nsample')
MI_re=MI;
for i=1:length(MI_re)
    MI{i}=mean(MI_re{i});
end
figure(2)
for i=1:length(nsample)
    MI_1(i)=MI{i}(1);
    MI_2(i)=MI{i}(2);
    MI_3(i)=MI{i}(3);
    MI_4(i)=MI{i}(4);
end
ggThemePlot(gca,'pale');
plot(nsample,MI_1,'-*','color',[0 114 189]/255,'linewidth',width);
hold on;
plot(nsample,MI_2,'-*','color',[255 201 14]/255,'linewidth',width);
plot(nsample,MI_3,'-*','color',[126 47 142]/255,'linewidth',width);
plot(nsample,MI_4,'-*','color',[217 83 25]/255,'linewidth',width);
% ylim([-0.05,1.1])
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('sample size','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\eta','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
hold off;
%% 
load('sample-fire-delta.mat','delta_measure','nsample')
delta_re=delta_measure;
for i=1:length(delta_re)
    delta{i}=mean(delta_re{i});
end
fosize=16;
width=2;
figure(3)
for i=1:length(nsample)
    delta_1(i)=delta{i}(1);
    delta_2(i)=delta{i}(2);
    delta_3(i)=delta{i}(3);
    delta_4(i)=delta{i}(4);
end
ggThemePlot(gca,'pale');
plot(nsample,delta_1,'-*','color',[0 114 189]/255,'linewidth',width);
hold on;
plot(nsample,delta_2,'-*','color',[255 201 14]/255,'linewidth',width);
plot(nsample,delta_3,'-*','color',[126 47 142]/255,'linewidth',width);
plot(nsample,delta_4,'-*','color',[217 83 25]/255,'linewidth',width);
% ylim([-0.05,1.1])
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('sample size','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\delta','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
hold off;
ylim([0,0.5])
%% 
load('sample-fire-pawn.mat','KS_mean','nsample')
KS_re=KS_mean;
for i=1:length(KS_re)
    KS{i}=mean(KS_re{i},1);
end
figure(4)
for i=1:length(nsample)
    KS_1(i)=KS{i}(1);
    KS_2(i)=KS{i}(2);
    KS_3(i)=KS{i}(3);
    KS_4(i)=KS{i}(4);
end
ggThemePlot(gca,'pale');
plot(nsample,KS_1,'-*','color',[0 114 189]/255,'linewidth',width);
hold on;
plot(nsample,KS_2,'-*','color',[255 201 14]/255,'linewidth',width);
plot(nsample,KS_3,'-*','color',[126 47 142]/255,'linewidth',width);
plot(nsample,KS_4,'-*','color',[217 83 25]/255,'linewidth',width);
% ylim([-0.05,1.1])
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('sample size','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\it\kappa','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
hold off;
ylim([0,0.9])