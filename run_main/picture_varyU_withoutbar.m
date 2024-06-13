clear;clc;close all
parentFolder = fullfile(pwd, '..'); % 获取当前目录的上级目录
allFolders = genpath(parentFolder); % 生成上级目录及其所有子目录的路径
addpath(allFolders); % 将这些路径加入到MATLAB的搜索路径中
load('result-fire-delta.mat','delta_measure','tt')
load('result-fire-MI.mat','MI')
load('result-fire-pawn.mat','KS_mean_re')
load('result-fire-sobol.mat','ST_full_re')
MI_re=MI;
delta_re=delta_measure;
KS_re=KS_mean_re;
ST_re=ST_full_re;
clearvars -except MI_re delta_re KS_re ST_re tt
%% 
for i=1:length(MI_re)
    delta{i}=mean(delta_re{i});
    KS{i}=mean(KS_re{i});
    MI{i}=mean(MI_re{i});
    ST{i}=mean(ST_re{i});
end
%% 
fosize=16;
width=2;
figure(1)
for i=1:length(tt)
    ST_1(i)=ST{i}(1);
    ST_2(i)=ST{i}(2);
    ST_3(i)=ST{i}(3);
    ST_4(i)=ST{i}(4);
end
ggThemePlot(gca,'pale');
plot(tt,ST_1,'-*','color',[0 114 189]/255,'linewidth',width);
hold on;
plot(tt,ST_2,'-*','color',[255 201 14]/255,'linewidth',width);
plot(tt,ST_3,'-*','color',[126 47 142]/255,'linewidth',width);
plot(tt,ST_4,'-*','color',[217 83 25]/255,'linewidth',width);
ylim([-0.05,1.1])
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('\itU_m','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\itS^T','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
hold off;
%% 
figure(2)
for i=1:length(tt)
    MI_1(i)=MI{i}(1);
    MI_2(i)=MI{i}(2);
    MI_3(i)=MI{i}(3);
    MI_4(i)=MI{i}(4);
end
ggThemePlot(gca,'pale');
plot(tt,MI_1,'-*','color',[0 114 189]/255,'linewidth',width);
hold on;
plot(tt,MI_2,'-*','color',[255 201 14]/255,'linewidth',width);
plot(tt,MI_3,'-*','color',[126 47 142]/255,'linewidth',width);
plot(tt,MI_4,'-*','color',[217 83 25]/255,'linewidth',width);
% ylim([-0.05,1.1])
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('\itU_m','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\eta','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
hold off;
%% 
figure(3)
for i=1:length(tt)
    delta_1(i)=delta{i}(1);
    delta_2(i)=delta{i}(2);
    delta_3(i)=delta{i}(3);
    delta_4(i)=delta{i}(4);
end
ggThemePlot(gca,'pale');
plot(tt,delta_1,'-*','color',[0 114 189]/255,'linewidth',width);
hold on;
plot(tt,delta_2,'-*','color',[255 201 14]/255,'linewidth',width);
plot(tt,delta_3,'-*','color',[126 47 142]/255,'linewidth',width);
plot(tt,delta_4,'-*','color',[217 83 25]/255,'linewidth',width);
% ylim([-0.05,1.1])
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('\itU_m','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\delta','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
hold off;
%% 
figure(4)
for i=1:length(tt)
    KS_1(i)=KS{i}(1);
    KS_2(i)=KS{i}(2);
    KS_3(i)=KS{i}(3);
    KS_4(i)=KS{i}(4);
end
ggThemePlot(gca,'pale');
plot(tt,KS_1,'-*','color',[0 114 189]/255,'linewidth',width);
hold on;
plot(tt,KS_2,'-*','color',[255 201 14]/255,'linewidth',width);
plot(tt,KS_3,'-*','color',[126 47 142]/255,'linewidth',width);
plot(tt,KS_4,'-*','color',[217 83 25]/255,'linewidth',width);
% ylim([-0.05,1.1])
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('\itU_m','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('KS','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
hold off;