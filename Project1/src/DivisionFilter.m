function m = DivisionFilter(data, coes_b, coes_a)
%return vectorized data of filter
    [number, ~] = size(coes_b);
    len = length(data);
    m = zeros(number, len);
    for i = 1 : number
        m(i, :) = filter(coes_b(i, :), coes_a(i, :), data);
    end
end