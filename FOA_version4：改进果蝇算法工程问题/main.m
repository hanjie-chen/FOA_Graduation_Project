%% 改进FOA 动态步长改进 用户400 连接节点36个
% version:4.0 author:hanjie-chen last update:2022/4/28
%% 清除环境
clc;
clear all;
close all;
% for gen=1:10 % 用于多次比较使用
%% 初始化参数
aln_number = 36;                                                                        %汇聚层节点个数
max_iteration=100000;                                                                   %最大迭代次数
population_size=50;                                                                     %初始化种群个数
max_fly_distance_initial=1;                                                             %果蝇单词最大飞行距离初始值      
Power_min = -80;                                                                        %最低通信功率
%% 初始化矩阵
X_best=zeros(max_iteration,aln_number);
Y_best=zeros(max_iteration,aln_number);
P_best=zeros(max_iteration,aln_number);
Smell_best = zeros(1,max_iteration);            %记录每次迭代找到的最优值
Coverage_Rate_best = zeros(1, max_iteration);   %记录每次迭代找到的覆盖率
Total_Power_bset = zeros(1, max_iteration);     %记录每次迭代找到的功率
%% 初始化汇聚层坐标和汇聚层功率；
X_axis=100*rand(1,aln_number);
Y_axis=100*rand(1,aln_number);
P_axis=11.5*((rand(1,aln_number)-0.5)*2)+12.5;
%% 首次嗅觉搜索
[X,Y,P]=Smell_Search_Function(X_axis,Y_axis,P_axis,population_size,aln_number,max_fly_distance_initial, max_fly_distance_initial);
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
    [max_fly_distance_initial_location, max_fly_distance_initial_power]=Dynamic_Fly_Distance(iteration_turn, max_iteration, 1, 100, 23);
    %% 嗅觉搜索
    [X,Y,P]=Smell_Search_Function(X_axis,Y_axis,P_axis,population_size,aln_number,max_fly_distance_initial_location, max_fly_distance_initial_power);
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
    
    X_best(iteration_turn,:)=X_axis;
    Y_best(iteration_turn,:)=Y_axis;
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

