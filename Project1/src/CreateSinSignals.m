function m = CreateSinSignals(sections, N, fs)    %生成正弦信号，返回的结果m为矩阵，行数为划分的区间数，列数为data的长度。每一行代表一个正弦信号
[number, ~] = size(sections);
m = zeros(number, N);
n = 1 : N;
dt = n / fs; 
for i = 1 : number
    m(i, :) = sin(2 * pi  * (sections(i, 1) + sections(i, 2))/2 * dt);
end
end