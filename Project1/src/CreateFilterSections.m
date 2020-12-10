function sections = CreateFilterSections(num_of_sec)
%划分频率区间
%
%sections = create_filter_sections(num_of_sec)
%   num_of_sec: 总共需要的区间数
%   sections: num_of_sec * 2 的矩阵，每一行表示一个区间范围
    len = 21.5412 / num_of_sec;
    sections = zeros(num_of_sec, 2);
    sections(1, 1) = 200;
    sections(num_of_sec, 2) = 7000;
    d = 5.7372 + len;
    for i = 1 : num_of_sec - 1
        sections(i, 2) = 165.4 * (10 ^ (0.06 * d) - 1);
        sections(i + 1, 1) = sections(i, 2);
        d = d + len;
    end
end