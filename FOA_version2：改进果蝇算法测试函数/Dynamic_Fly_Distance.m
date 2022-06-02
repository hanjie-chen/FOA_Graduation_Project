%% 动态步长调整函数
% 输入参数：当前迭代次数，最大迭代次数，当前步长
% 输出参数：修正之后的步长
% 为什么parameter最小是10，我是自己试出来的，我也不知道。max_fly_distance_initial最小是1也是同理
% version:0.0 author:hanjie-chen 2022/4/18

function [max_fly_distance_cruuent] = Dynamic_Fly_Distance(iteration_turn, iteration_max, max_fly_distance_initial, coordinate_range)
    parameter = coordinate_range / 10;
    if parameter < 10
        parameter = 10;
    end
    if max_fly_distance_initial < 1
        max_fly_distance_initial = 1;
    end
    max_fly_distance_cruuent = parameter*(1-(iteration_turn/iteration_max))*max_fly_distance_initial;
end