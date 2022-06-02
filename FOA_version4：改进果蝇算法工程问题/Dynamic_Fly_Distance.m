%% 动态步长调整函数
% 输入参数：当前迭代次数，最大迭代次数，当前步长
% 输出参数：修正之后的步长
% version:1.0 author:hanjie-chen 2022/4/29

function [max_fly_distance_location_cruuent, max_fly_distance_power_cruuent] = Dynamic_Fly_Distance(iteration_turn, iteration_max, max_fly_distance_initial, range_location, range_power)
    max_fly_distance_location_cruuent = (range_location/10)*(1-(iteration_turn/iteration_max))*max_fly_distance_initial;
    max_fly_distance_power_cruuent = (range_power/10)*(1-(iteration_turn/iteration_max))*max_fly_distance_initial;
end