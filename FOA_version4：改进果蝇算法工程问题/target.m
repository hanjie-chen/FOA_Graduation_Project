% 目标函数
function [f1,notconnect_rate]=target(x,cn_num)
gamma = 3;
notconnectSN = 0;
d0 = 1;
alpha = 50;
betas = 14.6;
for i = 5:10:100
    for j = 5:10:100
        flag = 1;
        for k = 1:cn_num 
            d = sqrt((x(k)-i)^2 + (x(k+cn_num)-j)^2);
            
            if(x(k+2*cn_num) - 10*gamma*log10(d/d0)-alpha-betas > -70)
                flag = 0;
            end
        end
        if(flag == 1)
            notconnectSN = notconnectSN + 1;
        end
    end
end
ans1 = 0;
for i= 1:cn_num
    ans1 =ans1 + x(i+2*cn_num);
end
   f1 = ans1 + 1000*notconnectSN^2;
   notconnect_rate = 1 - notconnectSN/100;
end