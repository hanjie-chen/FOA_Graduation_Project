%% 原始FOA 400个用户和36个连接节点的建模程序
% version:4.0 author:hanjie-chen last update:2022/4/28
%% 清除环境
clc;
clear all;
close all;
% for gen=1:10 % 用于多次比较使用
%% 初始化参数
aln_number = 36;                                                                        %连接节点个数
max_iteration=1000;                                                                     %最大迭代次数
population_size=50;                                                                     %初始化种群个数
max_fly_distance_initial=10;                                                            %果蝇单次最大飞行距离       
Power_min = -70;                                                                        %最低通信功率
%% 初始化矩阵
Smell_best = zeros(1,max_iteration);            %记录每次迭代找到的最优适应度
Coverage_Rate_best = zeros(1, max_iteration);   %记录每次迭代找到的覆盖率
Total_Power_bset = zeros(1, max_iteration);     %记录每次迭代找到的功率
%% 初始化汇聚层坐标和汇聚层功率；
X_axis=100*rand(1,aln_number);
Y_axis=100*rand(1,aln_number);
P_axis=ones(1,aln_number)*24;
%% 首次嗅觉搜索
[X,Y,P]=Smell_Search_Function(X_axis,Y_axis,P_axis,population_size,aln_number,max_fly_distance_initial);
%% 首次视觉搜索同时找到首个最佳适应度果蝇个体
[BestSmell,Index,Coverage_Rate,Total_Power]=Fitness_Function(X,Y,P,Power_min,population_size,aln_number);
%创建新变量SmellBest为全局最优
SmellBest=BestSmell;              
%% 首次取得最优个体的两个维度的X,Y,P坐标，其余果蝇的坐标向这个位置集中
X_axis=X(Index,:);
Y_axis=Y(Index,:);
P_axis=P(Index,:);
%% 迭代循环
for iteration_turn=1:max_iteration
    %% 嗅觉搜索
    [X,Y,P]=Smell_Search_Function(X_axis,Y_axis,P_axis,population_size,aln_number,max_fly_distance_initial);
    %% 视觉搜索
    [BestSmell,Index,Coverage_Rate,Total_Power]=Fitness_Function(X,Y,P,Power_min,population_size,aln_number);
%   如果本次搜索发现适应度更好，那么更新位置
    if BestSmell<SmellBest
        X_axis=X(Index,:);
        Y_axis=Y(Index,:);    
        P_axis=P(Index,:);
%       更新极值
        SmellBest=BestSmell;
    end
%   记录每次迭代的最优值和坐标
    Smell_best(iteration_turn)=SmellBest;
    Coverage_Rate_best(iteration_turn)=Coverage_Rate;
    Total_Power_bset(iteration_turn)=Total_Power;
    
end
SmellBest;
% S(gen)=SmellBest;
% end
%% 输出最终值 其实是一个数组
% S
%% 平均值mean和标准差std
% mean=mean(S)
% std=std(S)
%% 绘制图像
figure('name','总功率迭代曲线')
plot(Total_Power_bset);   %绘制每一代最优浓度值
xlabel('iteration trun');
ylabel('功率：mW');
title('总功率变化')

figure('name','覆盖率迭代曲线')
plot(Coverage_Rate_best);   %绘制每一代最优浓度值
xlabel('iteration trun');
ylabel('Coverage Value');
title('覆盖率变化')

figure('name','适应度迭代曲线')
plot(Smell_best);   %绘制每一代最优浓度值
xlabel('iteration trun');
ylabel('Fitness Value');
title('适应度迭代曲线')




