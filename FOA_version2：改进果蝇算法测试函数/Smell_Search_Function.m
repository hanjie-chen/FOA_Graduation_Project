%输入参数：果蝇群体坐标(X_axis && Y_axis)，果蝇种群大小，果蝇种群坐标维度，果蝇种群单词移动最大步长
%输出参数：果蝇种群嗅觉搜索之后新坐标(X && Y)，果蝇群体的味道浓度判定值Si
%% version：1.0 last update:2022/4/13 author:hanjie-chen

function [Smell_i,X,Y]=Smell_Search_Function(X_axis,Y_axis,population_size,dim,L)
%     初始化参数，使其成为两个population_size*dim的全0数组
    origin_distance=zeros(population_size,dim);
    Smell_i=zeros(population_size,dim);
%     将种群坐标扩充 2022/4/13未弄懂repmat
    X_axis=repmat(X_axis,population_size,1);    
    Y_axis=repmat(Y_axis,population_size,1);
%     嗅觉搜索：让果蝇随机飞行之后 求出每个果蝇的坐标矩阵;
    X=X_axis+L*(2*(rand(population_size,dim)-1/2));  
    Y=Y_axis+L*(2*(rand(population_size,dim)-1/2));
%     求出所有果蝇个体距离原点的距离sqrt(Xi^2+Yi^2)
    origin_distance=(X.^2+Y.^2).^0.5; 
%     求出所有果蝇的味道浓度判定值Si=1/origin_distance
    Smell_i=1./origin_distance;  
 
end