function [m, n] = Filters(index, sections, butter_level, fs)
    [len, ~] = size(sections);
    m = zeros(len, 2 * butter_level + 1);
    n = m;
    for i = 1 : len
        if index == 1
            [b ,a] = butter(butter_level, sections(i, :) / (fs / 2));
        elseif index == 2
            [b ,a] = cheby1(butter_level, 3, sections(i, :) / (fs / 2));
        elseif index == 3
            [b ,a] = besself(butter_level, sections(i, :) / (fs / 2));
        end
        m(i, :) = b;
        n(i, :) = a;
    end
end