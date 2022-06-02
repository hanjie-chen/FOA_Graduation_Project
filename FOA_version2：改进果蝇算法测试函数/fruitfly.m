%% FOA封装程序 
% version:1.0 author:hanjie-chen 2022/4/18
%% 清除环境
clc;
clear all;
close all;
for gen=1:10 % 用于多次比较使用
%% 初始化参数
% 选择测试函数,测试函数的定义域(left,right),测试函数维度
[Fitness_Function, coordinate_left_board, coordinate_right_board, dimension] = Test_Function(16);
max_iteration=1000;                                                                     %最大迭代次数
population_size=50;                                                                     %初始化种群个数
coordinate_range=(coordinate_right_board-coordinate_left_board)/2;                      %坐标的范围
coordiante_offset=(coordinate_right_board-coordinate_range);                            %坐标距离原点的偏移程度
max_fly_distance_initial=coordinate_range/100;                                          %果蝇单次最大飞行范围,坐标范围的百分之一                                       
%% 初始化矩阵
X_best=zeros(max_iteration,dimension);
Y_best=zeros(max_iteration,dimension);
Smell_best=zeros(1,max_iteration);      %记录每次迭代找到的最优值
%% 初始化果蝇坐标；
X_axis=coordinate_range*(2*(rand(1,dimension)-1/2))+coordiante_offset;
Y_axis=coordinate_range*(2*(rand(1,dimension)-1/2))+coordiante_offset;
%% 首次嗅觉搜索同时生成首次果蝇群体味道浓度判定值
[Smell_i,X,Y]=Smell_Search_Function(X_axis,Y_axis,population_size,dimension,max_fly_distance_initial);
%% 首次视觉搜索同时找到首个最佳适应度果蝇个体
[BestSmell,Index]=Fitness_Function(Smell_i);
%创建新变量SmellBest为全局最优
SmellBest=BestSmell;              
%% 首次取得最优个体的两个维度的X,Y坐标，其余果蝇的坐标像这个位置集中
X_axis=X(Index,:);
Y_axis=Y(Index,:);
%% 迭代循环
for iteration_turn=1:max_iteration
    max_fly_distance_dynamic = Dynamic_Fly_Distance(iteration_turn, max_iteration, max_fly_distance_initial, coordinate_range);
    %% 嗅觉搜索
    [Smell_i,X,Y]=Smell_Search_Function(X_axis,Y_axis,population_size,dimension,max_fly_distance_dynamic);
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
    X_best(iteration_turn,:)=X_axis;
    Y_best(iteration_turn,:)=Y_axis;
end
SmellBest;
S(gen)=SmellBest;
end
%% 输出最终值 其实是一个数组
S
%% 平均值mean和标准差std
mean=mean(S)
std=std(S)
%% 绘制图像
figure('name','迭代曲线')
plot(Smell_best);   %绘制每一代最优浓度值
xlabel('iteration trun');
ylabel('Fitness Value');
title('Improved FOA F16 Function')


% figure('name', '果蝇群体坐标变化')
% hold on
% plot(X_best(:,1),Y_best(:,1),'r.');%绘制果蝇群X_axis，Y_axis的变化
% plot(X_best(:,2),Y_best(:,2),'b.');
% plot(X_best(:,3),Y_best(:,3),'k.');

% figure('name', '最后果蝇群体的分布')
% plot(X(:,1),Y(:,1),'b.');%绘制最后一代的果蝇群;
% mean(S)
% min(S)
% std(S)

