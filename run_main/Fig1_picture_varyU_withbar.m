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
%miu_u=4.7
%% 
N=1000;
for i=1:length(tt)
ST(i,:)=mean(ST_re{i});
ST_sort=sort(ST_re{i}(:,1));
alpha=0.95;
T_low(i)=ST_sort(N*0.025+1);
T_up(i)=ST_sort(N*0.975-1);
ST_sort=sort(ST_re{i}(:,2));
RH_low(i)=ST_sort(N*0.025+1);
RH_up(i)=ST_sort(N*0.975-1);
ST_sort=sort(ST_re{i}(:,3));
U_low(i)=ST_sort(N*0.025+1);
U_up(i)=ST_sort(N*0.975-1);
ST_sort=sort(ST_re{i}(:,4));
FA_low(i)=ST_sort(N*0.025+1);
FA_up(i)=ST_sort(N*0.975-1);
end
figure(1)
linewidth=1.5;
marksize=2;
fosize=16;
ggThemePlot(gca,'pale');
E1=errorbar(tt,ST(:,1),ST(:,1)'-T_low,T_up-ST(:,1)');
hold on
E2=errorbar(tt,ST(:,2),ST(:,2)'-RH_low,RH_up-ST(:,2)');
E3=errorbar(tt,ST(:,3),ST(:,3)'-U_low,U_up-ST(:,3)');
E4=errorbar(tt,ST(:,4),ST(:,4)'-FA_low,FA_up-ST(:,4)');
C1=[0 114 189]/255;
C2=[255 127 39]/255;
C3=[126 47 142]/255;
C4=[198 0 0]/255;
set(E1,  'LineStyle', '-', 'Color', C1,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C1)
set(E2,  'LineStyle', '-', 'Color', C2,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C2)
set(E3,  'LineStyle', '-', 'Color', C3,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C3)
set(E4,  'LineStyle', '-', 'Color', C4,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C4)
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('\it\mu_U','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\itS^T','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
%% 
for i=1:length(tt)
MI(i,:)=mean(MI_re{i});
MI_sort=sort(MI_re{i}(:,1));
alpha=0.95;
T_low(i)=MI_sort(N*0.025+1);
T_up(i)=MI_sort(N*0.975-1);
MI_sort=sort(MI_re{i}(:,2));
RH_low(i)=MI_sort(N*0.025+1);
RH_up(i)=MI_sort(N*0.975-1);
MI_sort=sort(MI_re{i}(:,3));
U_low(i)=MI_sort(N*0.025+1);
U_up(i)=MI_sort(N*0.975-1);
MI_sort=sort(MI_re{i}(:,4));
FA_low(i)=MI_sort(N*0.025+1);
FA_up(i)=MI_sort(N*0.975-1);
end
figure(2)
linewidth=1.5;
marksize=2;
fosize=16;
ggThemePlot(gca,'pale');
E1=errorbar(tt,MI(:,1),MI(:,1)'-T_low,T_up-MI(:,1)');
hold on
E2=errorbar(tt,MI(:,2),MI(:,2)'-RH_low,RH_up-MI(:,2)');
E3=errorbar(tt,MI(:,3),MI(:,3)'-U_low,U_up-MI(:,3)');
E4=errorbar(tt,MI(:,4),MI(:,4)'-FA_low,FA_up-MI(:,4)');
C1=[0 114 189]/255;
C2=[255 127 39]/255;
C3=[126 47 142]/255;
C4=[198 0 0]/255;
set(E1,  'LineStyle', '-', 'Color', C1,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C1)
set(E2,  'LineStyle', '-', 'Color', C2,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C2)
set(E3,  'LineStyle', '-', 'Color', C3,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C3)
set(E4,  'LineStyle', '-', 'Color', C4,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C4)
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('\it\mu_U','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\it\eta','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
%% 
for i=1:length(tt)
delta(i,:)=mean(delta_re{i});
delta_sort=sort(delta_re{i}(:,1));
alpha=0.95;
T_low(i)=delta_sort(N*0.025+1);
T_up(i)=delta_sort(N*0.975-1);
delta_sort=sort(delta_re{i}(:,2));
RH_low(i)=delta_sort(N*0.025+1);
RH_up(i)=delta_sort(N*0.975-1);
delta_sort=sort(delta_re{i}(:,3));
U_low(i)=delta_sort(N*0.025+1);
U_up(i)=delta_sort(N*0.975-1);
delta_sort=sort(delta_re{i}(:,4));
FA_low(i)=delta_sort(N*0.025+1);
FA_up(i)=delta_sort(N*0.975-1);
end
figure(3)
linewidth=1.5;
marksize=2;
fosize=16;
ggThemePlot(gca,'pale');
E1=errorbar(tt,delta(:,1),delta(:,1)'-T_low,T_up-delta(:,1)');
hold on
E2=errorbar(tt,delta(:,2),delta(:,2)'-RH_low,RH_up-delta(:,2)');
E3=errorbar(tt,delta(:,3),delta(:,3)'-U_low,U_up-delta(:,3)');
E4=errorbar(tt,delta(:,4),delta(:,4)'-FA_low,FA_up-delta(:,4)');
C1=[0 114 189]/255;
C2=[255 127 39]/255;
C3=[126 47 142]/255;
C4=[198 0 0]/255;
set(E1,  'LineStyle', '-', 'Color', C1,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C1)
set(E2,  'LineStyle', '-', 'Color', C2,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C2)
set(E3,  'LineStyle', '-', 'Color', C3,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C3)
set(E4,  'LineStyle', '-', 'Color', C4,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C4)
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('\it\mu_U','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\it\delta','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
%% 
for i=1:length(tt)
KS(i,:)=mean(KS_re{i});
KS_sort=sort(KS_re{i}(:,1));
alpha=0.95;
T_low(i)=KS_sort(N*0.025+1);
T_up(i)=KS_sort(N*0.975-1);
KS_sort=sort(KS_re{i}(:,2));
RH_low(i)=KS_sort(N*0.025+1);
RH_up(i)=KS_sort(N*0.975-1);
KS_sort=sort(KS_re{i}(:,3));
U_low(i)=KS_sort(N*0.025+1);
U_up(i)=KS_sort(N*0.975-1);
KS_sort=sort(KS_re{i}(:,4));
FA_low(i)=KS_sort(N*0.025+1);
FA_up(i)=KS_sort(N*0.975-1);
end
figure(4)
linewidth=1.5;
marksize=2;
fosize=16;
ggThemePlot(gca,'pale');
E1=errorbar(tt,KS(:,1),KS(:,1)'-T_low,T_up-KS(:,1)');
hold on
E2=errorbar(tt,KS(:,2),KS(:,2)'-RH_low,RH_up-KS(:,2)');
E3=errorbar(tt,KS(:,3),KS(:,3)'-U_low,U_up-KS(:,3)');
E4=errorbar(tt,KS(:,4),KS(:,4)'-FA_low,FA_up-KS(:,4)');
C1=[0 114 189]/255;
C2=[255 127 39]/255;
C3=[126 47 142]/255;
C4=[198 0 0]/255;
set(E1,  'LineStyle', '-', 'Color', C1,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C1)
set(E2,  'LineStyle', '-', 'Color', C2,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C2)
set(E3,  'LineStyle', '-', 'Color', C3,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C3)
set(E4,  'LineStyle', '-', 'Color', C4,...
         'LineWidth', linewidth, 'Marker', 'o', 'MarkerSize', marksize, ...
         'MarkerEdgeColor', [.2 .2 .2], 'MarkerFaceColor' , C4)
leg=legend('\itT','\itRH','\itU','\itFA');
set(leg,'Location','northeast','fontsize',fosize,'fontname','Times New Roman','FontWeight','bold');
set(gca, 'fontsize',fosize,'fontname','Times New Roman');
set(gcf,'unit','centimeters','position',[10 5 20 15]);
xlabel('\it\mu_U','FontWeight','bold','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylabel('\it\kappa','FontWeight','bold','fontsize',fosize,'fontname','Times New Roman');
ylim([0,0.9])