t = 0:0.01:2*pi;
len = size(t);
signal_origin = 5*(sin(4*t)+1);
signal_with_noise = signal_origin + 1*(rand(len)-0.5);
% signal_with_noise = awgn(signal_origin,8);
result1 = zeros(1,len(2));
result2 = zeros(1,len(2));
window = zeros(1,30);

% % 加权滤波
% temp=0;
% for i = 1:len(2)
%     temp=temp*0.9+signal_with_noise(i)*0.1;
%     result1(i)=temp;
% end

% %滑动窗口滤波
% cnt = 1;
% window_len = 20;
% for i = 1:len(2)
%     cnt = cnt+1;
%     if cnt > window_len
%         cnt=1;
%     end

%     window(cnt) = signal_with_noise(i);
    
%     result2(i) = sum(window)/window_len;
%     % if i > window_len
%     %     result(i) = sum(window)/window_len;
%     % else
%     %     result(i) = 0;
%     % end
% end



% data = signal_with_noise;

% % 设置 LMS 算法的参数
% stepSize = 0.01; % 学习率
% filterOrder = 20; % 滤波器阶次

% % 初始化滤波器系数
% coeffs = zeros(1,filterOrder);

% % 初始化输出数组
% filteredData = zeros(1,length(data));

% % LMS 算法主体
% for i = filterOrder+1:length(data)
%     % 计算滤波器输出
%     filteredData(i) = coeffs * data(i-filterOrder:i-1)';
    
%     % 计算误差
%     error = data(i) - filteredData(i);
    
%     % 更新系数
%     coeffs = coeffs + stepSize * error * data(i-filterOrder:i-1);
% end

% result1 = filteredData;


% 采样频率
Fs = 10000;
% 截止频率
Fc = 0.5;
% 滤波器阶数
N = 2;
% 计算滤波器系数
[b, a] = butter(N, Fc,'low');
% 低通滤波
result1 = filter(b, a, signal_with_noise);


f1=figure(1);
plot(t,signal_origin,'r');
hold on;
plot(t,signal_with_noise,'g');
hold on;
plot(t,result1,'b');
hold on;
plot(t,result2,'m');
legend('原始图像','带噪声','权重滤波','滑动窗口滤波')