%输入参数：单只果蝇坐标(X_axis && Y_axis && P_axis)，果蝇种群大小，果蝇种群坐标维度，果蝇种群单词移动最大步长
%输出参数：果蝇种群嗅觉搜索之后新坐标(X && Y)
%本修改之后的函数用于真实情况建模
%% version：4.0 last update:2022/4/29 author:hanjie-chen

function [X,Y,P]=Smell_Search_Function(X_axis,Y_axis,P_axis,population_size,dim,L_location, L_power)
%     初始化X,Y,P三个population_size*36的果蝇群体
    X=zeros(population_size, dim);
    Y=zeros(population_size, dim);
    P=zeros(population_size, dim);
%     将种群坐标扩充 即X_axis(1,:)表示果蝇的其中一部分坐标。
    X_axis=repmat(X_axis,population_size,1);    
    Y_axis=repmat(Y_axis,population_size,1);
    P_axis=repmat(P_axis, population_size,1);
%     让第一只果蝇保存上一次果蝇群体找到的的最优值
    for j=1:dim
        X(1,j)=X_axis(1,j);
        Y(1,j)=Y_axis(1,j);
        P(1,j)=P_axis(1,j);
    end
%     嗅觉搜索：让果蝇随机飞行之后 求出每个果蝇的坐标矩阵;
%     因为果蝇一开始在集中在一个坐标上，在其基础之上进行嗅觉搜索    
    for i=2:population_size
        for j=1:dim
            X(i, j)=X_axis(i, j)+L_location*(2*(rand-1/2));
            Y(i, j)=Y_axis(i, j)+L_location*(2*(rand-1/2));
            P(i, j)=P_axis(i, j)+L_power*(2*(rand-1/2));
        end
    end
%     限制果蝇的搜索的边界，如果超出边界那么直接赋值为边界值
    for i=2:population_size
        for j=1:dim
            if X(i,j) > 100 || X(i, j) < 0
                X(i, j) = Limit_Board(X(i, j), 0, 100);
            end
            if Y(i,j) > 100 || Y(i, j) < 0
                Y(i, j) = Limit_Board(Y(i, j), 0, 100);
            end
            if P(i, j) > 24 || P(i, j) < 1
                P(i, j) = Limit_Board(P(i, j), 1, 24);
            end
        end
    end
end

function [right_value]=Limit_Board(base, left_board, right_board)
if base > right_board
    right_value=right_board;
end
if base < left_board
    right_value=left_board;
end
end