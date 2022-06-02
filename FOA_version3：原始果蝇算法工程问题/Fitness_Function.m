% 400个用户和36个AP节点的适应度函数
%% version:2.0 author:hanjie-chen last update:2022/5/11
function [BestSmell, Index, Coverage_Rate, Total_Power] = Fitness_Function(X_axis, Y_axis, P_axis, P_min, population_size, aln_number)
% 计算每只果蝇的覆盖率，每只果蝇的未覆盖节点个数，其结果为一个大小为population_size的以为数组
[Coverage_Rate_Group, unconnected_pln_number] = Calculate_Coverage_Rate(X_axis, Y_axis, P_axis, P_min, population_size, aln_number);
% Smell为其适应度函数值 Total_Power是总功率
Smell = zeros(1, population_size);
Total_Power_Group = zeros(1, population_size);
% 计算每只果蝇得出的功率 转换单位dBm到mW
for i=1:population_size
    for j = 1:aln_number
        Total_Power_Group(i) = Total_Power_Group(i) + power(10, P_axis(i,j)/10);
    end
%     加上惩罚项系数1000*aln_number^2
    Smell(i)=Total_Power_Group(i)+1000*(unconnected_pln_number(i)^2);
end
[BestSmell, Index]=min(Smell);
Coverage_Rate = Coverage_Rate_Group(Index);
Total_Power = Total_Power_Group(Index);
end

function [Coverage_Rate_Group, unconnected_pln_number] = Calculate_Coverage_Rate(X_axis, Y_axis, P_axis, P_min, population_size, aln_number)
alpha = 50;
gamma = 3;
d0 = 1;
beta_s = 14.6;

connected_number_group = zeros(1, population_size);
Coverage_Rate_Group = zeros(1,population_size);
unconnected_pln_number = zeros(1, population_size);

for k=1:population_size
%     初始化每只果蝇的连接数量为0
    connected_number = 0;
%     计算第k只果蝇的第j个汇聚层节点是否和第i个感知层节点是否有连接
    for i = 1:400
        for j = 1:aln_number
%             计算第k只果蝇第j个汇聚层结点和第i个感知层节点的距离d
            d = Calculate_Distance(X_axis(k, j), Y_axis(k, j), i);
%             计算传播损耗beta
            beta = alpha+10*gamma*log10(d/d0)+beta_s;
%             如果减去传播损耗依然大于最低通信限度，则说明两者存在连接，退出汇聚层节点循环，判断下一个感知层节点
            if (P_axis(k, j)-beta > P_min)
                connected_number = connected_number + 1;
                break;
            end
        end
    end
%     第k只果蝇的感知层节点连接数，未连接数，覆盖率
    connected_number_group(k)=connected_number;
    unconnected_pln_number(k) = 400-connected_number;
    Coverage_Rate_Group(k) = connected_number / 400;
end

end

function [d] = Calculate_Distance(X_axis_single, Y_axis_single, i)
% 计算第i个感知层节点的坐标
pln_x_axis = mod((i-1), 20)*5 + 2.5;
pln_y_axis = floor((i-1)/20)*5 + 2.5;
% 计算汇聚层节点和感知层节点之间的距离
d = ((X_axis_single-pln_x_axis)^2+(Y_axis_single-pln_y_axis)^2)^0.5;
end