% 测试函数文件：果蝇适应度判定函数选择文件
% 测试函数的格式:function [BestSmell,Index]=Fun(Si)其中BestSmell是果蝇群体中的最佳适应度，Index果蝇群体中具有最佳适应度的果蝇下标
% 输入参数：测试函数的标号
% 输出参数：适应度函数，适应度函数定义域，适应度函数的维度
% version:2.0 2022/4/17 author:hanjie-chen
%% 测试函数调用
function [Fitness_Function, coordinate_left_board, coordinate_right_board, dimension] = Test_Function(function_number)
    if function_number == 1
        Fitness_Function=@F1;
        coordinate_left_board = -100;
        coordinate_right_board = 100;
        dimension = 30;
    elseif function_number == 2
        Fitness_Function=@F2;
        coordinate_left_board = -10;
        coordinate_right_board = 10;
        dimension = 30;
    elseif function_number == 3
        Fitness_Function=@F3;
        coordinate_left_board = -100;
        coordinate_right_board = 100;
        dimension = 30;
    elseif function_number == 4
        Fitness_Function=@F4;
        coordinate_left_board = -100;
        coordinate_right_board = 100;
        dimension = 30;
    elseif function_number == 5
        Fitness_Function=@F5;
        coordinate_left_board = -100;
        coordinate_right_board = 100;
        dimension = 30;
    elseif function_number == 6
        Fitness_Function=@F6;
        coordinate_left_board = -1.28;
        coordinate_right_board = 1.28;
        dimension = 30;
    elseif function_number == 7
        Fitness_Function=@F7;
        coordinate_left_board = -10;
        coordinate_right_board = 10;
        dimension = 30;
    elseif function_number == 8
        Fitness_Function=@F8;
        coordinate_left_board = -100;
        coordinate_right_board = 100;
        dimension = 30;
    elseif function_number == 9
        Fitness_Function=@F9;
        coordinate_left_board = -5;
        coordinate_right_board = 10;
        dimension = 30;
    elseif function_number == 10
        Fitness_Function=@F10;
        coordinate_left_board = -900;
        coordinate_right_board = 900;
        dimension = 30;
    elseif function_number == 11
        Fitness_Function=@F11;
        coordinate_left_board = -10;
        coordinate_right_board = 10;
        dimension = 30;
    elseif function_number == 12
        Fitness_Function=@F12;
        coordinate_left_board = -5;
        coordinate_right_board = 5;
        dimension = 30;
    elseif function_number == 13
        Fitness_Function=@F13;
        coordinate_left_board = -5.12;
        coordinate_right_board = 5.12;
        dimension = 30;
    elseif function_number == 14
        Fitness_Function=@F14;
        coordinate_left_board = -32;
        coordinate_right_board = 32;
        dimension = 30;
    elseif function_number == 15
        Fitness_Function=@F15;
        coordinate_left_board = -600;
        coordinate_right_board = 600;
        dimension = 30;
    elseif function_number == 16
        Fitness_Function=@F16;
        coordinate_left_board = -50;
        coordinate_right_board = 50;
        dimension = 30;
    elseif function_number == 17
        Fitness_Function=@F17;
        coordinate_left_board = -50;
        coordinate_right_board = 50;
        dimension = 30;
    elseif function_number == 18
        Fitness_Function=@F18;
        coordinate_left_board = -10;
        coordinate_right_board = 10;
        dimension = 30;
    elseif function_number == 19
        Fitness_Function=@F19;
        coordinate_left_board = -5.12;
        coordinate_right_board = 5.12;
        dimension = 30;
    elseif function_number == 20
        Fitness_Function=@F20;
        coordinate_left_board = -100;
        coordinate_right_board = 100;
        dimension = 30;
    elseif function_number == 21
        Fitness_Function=@F21;
        coordinate_left_board = -10;
        coordinate_right_board = 10;
        dimension = 30;
    elseif function_number == 22
        Fitness_Function=@F22;
        coordinate_left_board = -500;
        coordinate_right_board = 500;
        dimension = 30;
    elseif function_number == 23
        Fitness_Function=@F23;
        coordinate_left_board = -10;
        coordinate_right_board = 10;
        dimension = 2;
    elseif function_number == 24
        Fitness_Function=@F24;
        coordinate_left_board = -100;
        coordinate_right_board = 100;
        dimension = 30;
    elseif function_number == 25
        Fitness_Function=@F25;
        coordinate_left_board = 0;
        coordinate_right_board = pi;
        dimension = 10;
    elseif function_number == 26
        Fitness_Function=@F26;
        coordinate_left_board = -5;
        coordinate_right_board = 5;
        dimension = 4;
    elseif function_number == 27
        Fitness_Function=@F27;
        coordinate_left_board = -5;
        coordinate_right_board = 5;
        dimension = 2;
    elseif function_number == 28
        Fitness_Function=@F28;
        coordinate_left_board = -5;
        coordinate_right_board = 5;
        dimension = 2;
    elseif function_number == 29
        Fitness_Function=@F29;
        coordinate_left_board = -2;
        coordinate_right_board = 2;
        dimension = 2;
    elseif function_number == 30
        Fitness_Function=@F30;
        coordinate_left_board = 1;
        coordinate_right_board = 3;
        dimension = 3;
    else
        error('Please enter number1~30');
    end
end

%% Unimodal Function 单极值函数
function [BestSmell,Index]=F1(Si)
%     具体的函数内容
Si_2=Si.^2;         %所有元素平方;
Smell=Si_2;
Smell=sum(Smell,2);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end
% F2测试函数:范围-10 ~ 10
function [BestSmell,Index]=F2(Si)
%     具体的函数内容
Si_2=abs(Si);      
Smell=sum(Si_2, 2) + prod(Si_2, 2);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

function [BestSmell,Index]=F3(Si)
%     具体的函数内容
[si_m,si_n]=size(Si);
sum_2=zeros(si_m,1);
sum_3=zeros(si_m,1);
for p=1:si_m        
    for d=1:si_n
        sum_2(p)=sum_2(p)+Si(p, d);
    end
end
for p=1:si_m
    for d=1:p
        sum_3(p)=sum_3(p)+sum_2(d);
    end
end
sum_3 = sum_3.^2;
Smell=sum(sum_3, 2);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

function [BestSmell,Index]=F4(Si)
%     具体的函数内容
Si_2=abs(Si);      
Smell=max(Si_2);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

function [BestSmell,Index]=F5(Si)
%     具体的函数内容
Si_2 = Si+0.5;
Si_3 = abs(Si_2).^2;
Smell = sum(Si_3, 2);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

%F6测试函数:范围-1.28 ~ 1.28
function [BestSmell,Index]=F6(Si)
%     具体的函数内容
[si_m,si_n]=size(Si);
sum_2=zeros(1,si_n);
for d=1:si_n
    sum_2(d)=d;
end
Si_2=Si.^4;         
Smell=Si_2.*sum_2+rand();
Smell=sum(Smell,2);
[BestSmell,Index]=min(Smell);
end
% 新增函数：Bent Cigar Function
function [BestSmell,Index]=F7(Si)
%     具体的函数内容
dim=size(Si,2);
for i=1:dim
    Smell(i)=Si(1)^2+10^6*(sum(Si(2:i).^2));
end
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

% 新增函数：Sum of Different Power Function
function [BestSmell,Index]=F8(Si)
%     具体的函数内容
dim=size(Si,2);
Smell=zeros(1,dim);
Smell(1)=Si(1);
for i=2:dim
  Smell(i)=Smell(i-1)+abs(Si(i))^(i+1);
end
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

% 新增函数：Zakharov Function
function [BestSmell,Index]=F9(Si)
%     具体的函数内容
dim=size(Si,2);

for i=1:dim
    sum_1(i)=sum(Si(1:i).^2);
    sum_2(i)=sum(Si(1:i).*0.5)^2;
    sum_3(i)=sum(Si(1:i).*0.5)^4;
end

Smell=sum_1+sum_2+sum_3;
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end
% 新增函数：TRID FUNCTION 详见：http://www.sfu.ca/~ssurjano/trid.html
function [BestSmell,Index]=F10(Si)
%     具体的函数内容
dim=size(Si,2);
sum_1=zeros(1,dim);
sum_2=zeros(1,dim);
for i=1:dim
    sum_1(i)=sum_1(i)+(Si(i)-1)^2;
end
for i=2:dim
    sum_2(i)=sum_2(i-1)+Si(i)*Si(i-1);
end
Smell=sum_1-sum_2;
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end
% 新增函数：DIXON-PRICE FUNCTION 详见：http://www.sfu.ca/~ssurjano/dixonpr.html
function [BestSmell,Index]=F11(Si)
dim=size(Si,2);
temp=(Si(1)-1)^2;
sum=zeros(1,dim);
for ii = 2:dim
	xi = Si(ii);
	xold = Si(ii-1);
	new = ii * (2*xi^2 - xold)^2;
	sum(ii) = sum(ii) + new;
end
Smell=temp+sum;
[BestSmell,Index]=min(Smell);
end
%% Multimodal Function 多极值函数
% STYBLINSKI-TANG FUNCTION 详见：http://www.sfu.ca/~ssurjano/stybtang.html
function [BestSmell,Index]=F12(Si)
dim=size(Si,2);
sum = zeros(1,dim);
for ii = 1:dim
	xi = Si(ii);
	new = xi^4 - 16*xi^2 + 5*xi;
	sum(ii) = sum(ii) + new;
end

Smell = sum/2;
[BestSmell,Index]=min(Smell);
end

% F7测试函数：范围-5.12 ~ 5.12
function [BestSmell,Index]=F13(Si)
%     具体的函数内容
Si_1 = Si.^2;
Si_2 = 10*cos(2*pi*Si);
Smell = sum(Si_1-Si_2+10, 2);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

% F8测试函数：范围-32 ~ 32
function [BestSmell,Index]=F14(Si)
%     具体的函数内容
dim=size(Si,2);
Smell=-20*exp(-.2*sqrt(sum(Si.^2, 2)./dim))-exp(sum(cos(2*pi.*Si), 2)./dim)+20+exp(1);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

% F9测试函数：范围-600 ~ 600
function [BestSmell,Index]=F15(Si)
%     具体的函数内容
[si_m,si_n]=size(Si);
mult=ones(si_m,1);
Si_2=Si.^2;         %所有元素平方;
sum_2=sum(Si_2,2);  %平方和项
sum_2=sum_2/4000;   %第一部分

for p=1:si_m        %cos(Xi)/sqrt(i)部分
    for d=1:si_n
        mult(p)=mult(p)*cos(Si(p,d)/sqrt(d));
    end
end
Smell=sum_2-mult+1;
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

% F13测试函数：范围-50 ~ 50
function [BestSmell,Index]=F16(Si)
%     具体的函数内容
[si_m,si_n]=size(Si);
sum_2=zeros(si_m,1);
part_2=zeros(si_m, 1);
last_part=zeros(si_m, 1);
for p=1:si_m        
    for d=1:si_n
        sum_2(p)=sum_2(p)+Si(p, d);
    end
end
part_1=10*sin(pi*(1+(1+sum_2(1))/4));
for p=1:si_m-1
    part_2(p)=(((1+sum_2(p))/4)^2)*(1+10*(sin(pi*(1+(1+sum_2(p+1))/4)))^2);
end
part_3=(sum_2(si_m)-1)^2;

for p=1:si_m
    last_part(p)=100*((sum_2(p)-10)^4)*(sum_2(p)>10)+100*((-sum_2(p)-10)^4)*(sum_2(p)<(-10));
end
Smell=(pi/si_m)*(part_1+sum(part_2, 2)+part_3)+sum(last_part, 2);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

% F14测试函数：范围-50 ~ 50
function [BestSmell,Index]=F17(Si)
%     具体的函数内容
[si_m,si_n]=size(Si);
sum_2=zeros(si_m,1);
part_2=zeros(si_m, 1);
last_part=zeros(si_m, 1);
for p=1:si_m        
    for d=1:si_n
        sum_2(p)=sum_2(p)+Si(p, d);
    end
end
part_1=sin(3*pi*sum_2(1))^2;
for p=1:si_m
    part_2(p)=((sum_2(p)-1)^2)*(1+(sin(3*pi*sum_2(p)+1))^2);
end
part_3=((sum_2(si_m)-1)^2)*(1+(sin(2*pi*sum_2(si_m)))^2);
for p=1:si_m
    last_part(p)=100*((sum_2(p)-10)^4)*(sum_2(p)>10)+100*((-sum_2(p)-10)^4)*(sum_2(p)<(-10));
end
Smell=(1/10)*(part_1+sum(part_2)+part_3)+sum(last_part);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

% F15新增测试函数：Rosenbrock’s Function
function [BestSmell,Index]=F18(Si)
%     具体的函数内容
dim=size(Si,2);
for i=1:(dim-1)
sum_1(i)=100*((Si(i)^2-Si(i+1))^2);
sum_2(i)=(Si(i)-1)^2;
sum_3(i)=sum_1(i)+sum_2(i);
end
Smell(1)=sum_3(1);
for i=2:(dim-1)
    Smell(i)=Smell(i-1)+sum_3(i);
end
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

% F16新增测试函数：Rastrigin’s Function
function [BestSmell,Index]=F19(Si)
%     具体的函数内容
dim=size(Si,2);
Smell=sum(Si.^2-10*cos(2*pi*Si)+10);
for i=1:dim
    sum_1(i)=Si(i)^2-10*cos(2*pi*Si(i))+10;
end
Smell(1)=sum_1(1);
for i=2:dim
    Smell(i)=Smell(i-1)+sum_1(i);
end
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

% F17新增测试函数：Non-continuous Rotated Rastrigin’s Function
function [BestSmell,Index]=F20(Si)
%     具体的函数内容
dim=size(Si,2);
Smell=zeros(1,dim);
for i=1:dim
    if abs(Si(i))<1/2
        y(i)=Si(i);
    else 
        y(i)=(round(2*Si(i)))/2;
    end
    Smell(i)=Smell(i)+y(i)^2-10*cos(2*pi*y(i))+10;
end
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end
% F18新增测试函数：Levy Function 函数范围[-10,10]
function [BestSmell,Index]=F21(Si)
%     具体的函数内容
dim=size(Si,2);
w=1+(Si-1)/4;
sum_1=sum(((w(1:dim-1)-1).^2).*(1+(10*((sin(pi*w(1:dim-1)+1)).^2))));
sum_2=(sin(pi*w(1)))^2;
sum_3=((w(dim)-1)^2)*(1+10*((sin(pi*w(dim)))^2));
Smell=sum_1+sum_2+sum_3;
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end

% 新增函数：SCHWEFEL FUNCTION 详见：http://www.sfu.ca/~ssurjano/schwef.html
function [BestSmell,Index]=F22(Si)
d = size(Si,2);
sum = zeros(1,d);
for ii = 1:d
	xi = Si(ii);
	sum(ii) = sum(ii) + xi*sin(sqrt(abs(xi)));
end
for i=1:d
    Smell(i)=418.9829*d - sum(i);
end

[BestSmell,Index]=min(Smell);
end
% 新增函数：SHUBERT FUNCTION 详见http://www.sfu.ca/~ssurjano/shubert.html
% dim=2 范围-5.12~5.12
function [BestSmell,Index]=F23(Si)
x1 = Si(1);
x2 = Si(2);
sum1 = zeros(1,5);
sum2 = zeros(1,5);

for ii = 1:5
	new1 = ii * cos((ii+1)*x1+ii);
	new2 = ii * cos((ii+1)*x2+ii);
	sum1(ii) = sum1(ii) + new1;
	sum2(ii) = sum2(ii) + new2;
    Smell(ii)=sum1(ii)*sum2(ii);
end
[BestSmell,Index]=min(Smell);
end
% 新增函数：PERM FUNCTION 详见：http://www.sfu.ca/~ssurjano/perm0db.html
function [BestSmell,Index]=F24(Si)
d = size(Si,2);
b = 10;
Smell=zeros(1,d);
for ii = 1:d
	inner = zeros(1,d);
	for jj = 1:d
		xj = Si(jj);
        inner(jj) = inner(jj) + (jj+b)*(xj^ii-(1/jj)^ii);
	end
	Smell(ii) = Smell(ii) + inner(ii)^2;
end

[BestSmell,Index]=min(Smell);
end

%% 混合维度函数
% 新增函数：MICHALEWICZ FUNCTION 详见：http://www.sfu.ca/~ssurjano/michal.html
function [BestSmell,Index]=F25(Si)
dim = size(Si,2);
m = 10;
sum = zeros(1,dim);

for ii = 1:dim
	xi = Si(ii);
	new = sin(xi) * (sin(ii*xi^2/pi))^(2*m);
	sum(ii)  = sum(ii) + new;
end

Smell = -sum;
[BestSmell,Index]=min(Smell);
end

%F19 dim=4 范围-5 ~ 5
function [BestSmell,Index]=F26(Si)
%     具体的函数内容
[si_m,si_n]=size(Si);
sum_2=zeros(si_m,1);
for p=1:si_m        
    for d=1:si_n
        sum_2(p)=sum_2(p)+Si(p, d);
    end
end
aK=[.1957 .1947 .1735 .16 .0844 .0627 .0456 .0342 .0323 .0235 .0246];
bK=[.25 .5 1 2 4 6 8 10 12 14 16];
bK=1./bK;
Smell=sum((aK-((sum_2(1).*(bK.^2+sum_2(2).*bK))./(bK.^2+sum_2(3).*bK+sum_2(4)))).^2);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end
%F20 dim=2 范围-5 ~ 5
function [BestSmell,Index]=F27(Si)
%     具体的函数内容
[si_m,si_n]=size(Si);
sum_2=zeros(si_m,1);
for p=1:si_m        
    for d=1:si_n
        sum_2(p)=sum_2(p)+Si(p, d);
    end
end
Smell=4*(sum_2(1)^2)-2.1*(sum_2(1)^4)+(sum_2(1)^6)/3+sum_2(1)*sum_2(2)-4*(sum_2(2)^2)+4*(sum_2(2)^4);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end
%F21 dim=2 范围-5 ~ 5
function [BestSmell,Index]=F28(Si)
%     具体的函数内容
[si_m,si_n]=size(Si);
sum_2=zeros(si_m,1);
for p=1:si_m        
    for d=1:si_n
        sum_2(p)=sum_2(p)+Si(p, d);
    end
end
Smell=(sum_2(2)-(sum_2(1)^2)*5.1/(4*(pi^2))+5/pi*sum_2(1)-6)^2+10*(1-1/(8*pi))*cos(sum_2(1))+10;
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end
%F22 dim=2 范围-2 ~ 2
function [BestSmell,Index]=F29(Si)
%     具体的函数内容
[si_m,si_n]=size(Si);
sum_2=zeros(si_m,1);
for p=1:si_m        
    for d=1:si_n
        sum_2(p)=sum_2(p)+Si(p, d);
    end
end
Smell=(1+(sum_2(1)+sum_2(2)+1)^2*(19-14*sum_2(1)+3*(sum_2(1)^2)-14*sum_2(2)+6*sum_2(1)*sum_2(2)+3*sum_2(2)^2))*...
    (30+(2*sum_2(1)-3*sum_2(2))^2*(18-32*sum_2(1)+12*(sum_2(1)^2)+48*sum_2(2)-36*sum_2(1)*sum_2(2)+27*(sum_2(2)^2)));
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end
%F23 dim=3 范围1 ~ 3
function [BestSmell,Index]=F30(Si)
%     具体的函数内容
[si_m,si_n]=size(Si);
sum_2=zeros(si_m,1);
for p=1:si_m        
    for d=1:si_n
        sum_2(p)=sum_2(p)+Si(p, d);
    end
end
aH=[3 10 30;
    .1 10 35;
    3 10 30;
    .1 10 35];
cH=[1 1.2 3 3.2];
pH=[.3689 .117 .2673;
    .4699 .4387 .747;
    .1091 .8732 .5547;
    .03815 .5743 .8828];
sum_3=zeros(4, 1);
for i=1:4
    for j=1:3
    sum_3=sum_3+cH(i)*exp(-(sum(aH(i,j).*((sum_2(j)-pH(i,j)).^2))));
    end
end
Smell=sum(sum_3);
%     找到Smell中的最小值及其下标
    [BestSmell,Index]=min(Smell);
end
