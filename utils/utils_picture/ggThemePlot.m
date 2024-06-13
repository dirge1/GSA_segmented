function ax=ggThemePlot(varargin)
% @author:slandarer
% 
% 参数说明：
% -----------------------------------------------------
% AxesTheme   | 坐标区域风格       | 'flat'/'flat_dark'/'camouflage'/'chalk'/
%                                    'copper'/'dust'/'earth'/'fresh'/'grape'/
%                                    'grass'/'greyscale'/'light'/'lilac'/'pale'
%                                    'sea'/'sky'/'solarized'

% 获取要处理的坐标区域=====================================================
if strcmp(get(varargin{1},'type'),'axes' )
    ax=varargin{1};
else
    ax=gca;
end
hold(ax,'on')
for i=1:length(ax.Children)
    if strcmp(get(ax.Children(i),'type'),'line')
        ax.Children(i).ColorMode='auto';
        ax.Children(i).MarkerSize=10;
    end
end

% default==================================================================
theme.AxesTheme='flat';
if length(varargin)>1
    theme.AxesTheme=varargin{2};
end
ax.Box='off';
ax.YGrid='on';
ax.XGrid='on';
ax.GridLineStyle='--';
ax.LineWidth=1.2;
% 主题风格化
Tm=load('themeCSS.mat');
Tm=Tm.theme;
ax.Color=Tm.(theme.AxesTheme).Color;
ax.TickLength=Tm.(theme.AxesTheme).TickLength;
ax.GridColorMode=Tm.(theme.AxesTheme).GridColorMode;
ax.GridColor=Tm.(theme.AxesTheme).GridColor;
ax.GridAlpha=Tm.(theme.AxesTheme).GridAlpha;
ax.XColor=Tm.(theme.AxesTheme).XColor;
ax.YColor=Tm.(theme.AxesTheme).YColor;
ax.TickDir=Tm.(theme.AxesTheme).TickDir;
ax.ColorOrder=Tm.(theme.AxesTheme).ColorOrder;
end