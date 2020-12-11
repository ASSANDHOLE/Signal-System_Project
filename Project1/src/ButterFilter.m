function [m, n] = ButterFilter(sections, butter_level, fs)
    [len, ~] = size(sections);
    m = zeros(len, 2 * butter_level + 1);
    n = m;
    for i = 1 : len
        %[b ,a] = butter(butter_level, sections(i, :) / (fs / 2));
        [b ,a] = cheby1(butter_level, 3, sections(i, :) / (fs / 2));
        m(i, :) = b;
        n(i, :) = a;
    end
end