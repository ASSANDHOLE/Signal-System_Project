function m = SumWithoutExceptions(divided_datas)
%this function returns the add result after remove exceptions(data > 0.3)
    [numbers, len] = size(divided_datas);
    m = zeros(1, len);
    for i = 1 : numbers
        if max(divided_datas(i, :)) <= 0.3
            m = m + divided_datas(i, :);
        end
    end
end