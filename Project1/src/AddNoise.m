function res = AddNoise(data, fs, SNR)
%res = AddNoise(data, fs, SNR)
%   res: audio data after add noise
%   data: original audio data
%   fs: original audio fs
%   SNR: noise
    [Pxx, w] = periodogram(data, [], 512, fs);
    b = fir2(3000, w / (fs / 2), sqrt(Pxx / max(Pxx)));
    noise = 1 - 2 * rand(1, length(data) + length(b));
    SSN = filter(b, 1, noise);
    SSN = SSN((length(b) + 1) : end);
    norm_ratio = 10 ^ (SNR / 20);
    SSN =  SSN * norm(data) / norm(SSN) / norm_ratio;
    res = data + SSN';
    res = res(1 : length(data));
end
