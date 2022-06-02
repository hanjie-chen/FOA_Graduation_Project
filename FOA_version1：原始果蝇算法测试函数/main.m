%% FOA封装程序 
%% 清除环境 
clc;
clear all;
close all;
% for gen=1:10 % 跑10次算法 求得算法结果的平均值和标准差
%% 初始化参数
% 选择测试函数,测试函数的定义域(left,right),测试函数维度
[Fitness_Function, coordinate_left_board, coordinate_right_board, dimension] = Test_Function(26);
max_iteration=1000;                                                                     %最大迭代次数
population_size=50;                                                                     %初始化种群个数
coordinate_range=(coordinate_right_board-coordinate_left_board)/2;                      %坐标的范围
coordiante_offset=(coordinate_right_board-coordinate_range);                            %坐标距离原点的偏移程度
max_fly_distance=1;                                                  
% 记录每次迭代找到的最优值 现在是一个全0数组
Smell_best=zeros(1,max_iteration);      
%% 初始化果蝇坐标；
X_axis=coordinate_range*(2*(rand(1,dimension)-1/2))+coordiante_offset;
Y_axis=coordinate_range*(2*(rand(1,dimension)-1/2))+coordiante_offset;
%% 首次嗅觉搜索同时生成首次果蝇群体味道浓度判定值
[Smell_i,X,Y]=Smell_Search_Function(X_axis,Y_axis,population_size,dimension,max_fly_distance);
%% 首次视觉搜索同时找到首个最佳适应度果蝇个体
[BestSmell,Index]=Fitness_Function(Smell_i);
%创建新变量SmellBest为全局最优
SmellBest=BestSmell;              
%% 首次取得最优个体的两个维度的X,Y坐标，其余果蝇的坐标像这个位置集中
X_axis=X(Index,:);
Y_axis=Y(Index,:);
%% 迭代循环
for iteration_turn=1:max_iteration
    %% 嗅觉搜索
    [Smell_i,X,Y]=Smell_Search_Function(X_axis,Y_axis,population_size,dimension,max_fly_distance);
    %% 视觉搜索
    [BestSmell,Index]=Fitness_Function(Smell_i);
%   如果本次搜索发现适应度更好，那么更新位置
    if BestSmell<SmellBest
        X_axis=X(Index,:);
        Y_axis=Y(Index,:);    
%       更新极值
        SmellBest=BestSmell;
    end
%   记录每次迭代的最优值和坐标
    Smell_best(iteration_turn)=SmellBest;
end
% S(gen)=SmellBest;
% end
%% 输出最终值 其实是一个数组
% S
%% 平均值mean和标准差std
% mean=mean(S)
% std=std(S)
%% 绘制图像
figure('name','迭代曲线')
plot(Smell_best);   %绘制每一代最优浓度值
xlabel('iteration trun');
ylabel('Fitness Value');
title('F26');

