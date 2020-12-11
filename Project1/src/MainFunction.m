function [sound_data, fs] = MainFunction(audio_name, noise_vol, function_index, butter_level, cut_off_freq, divide_number, play_sound)
%读取音频并处理
%
%[sound_data, fs] = MainFunction(audio_name, butter_level, function_index, cut_off_freq, divide_number, play_sound)
%   [sound_data, fs]: 处理的最终结果，其中sound_data为音频数据，fs为频率
%   audio_name: 音频文件名字
%   noise_vol: 噪音大小
%   function_index: 1 -> butter, 2 -> cheby, 3-> bess
%   butter_level: low-pass filter的cut off frequency
%   divide_number: 分组组数
%   play_sound: 是否播放音频，默认为0，仅当值为1是播放
%   
%   example: [sound_data, fs] = MainFunction('sound.wav', 0, 1, 4, 50, 32, 1)
    
    if (nargin < 6)
        play_sound = 0;
    end
    [data, fs] = audioread(audio_name);
    data = data(:, 1);
    if (noise_vol ~= 0)
        data = AddNoise(data, fs, noise_vol);
    end
    len = length(data);
    sections = CreateFilterSections(divide_number);       
    [butter_b, butter_a] = Filters(function_index ,sections, butter_level, fs);
    divided_datas = DivisionFilter(data, butter_b, butter_a);
    [cutoff_b, cutoff_a] = butter(butter_level, cut_off_freq / (fs / 2) );
    envelopes = filter(cutoff_b, cutoff_a, abs(divided_datas'))';
    sin_signals = CreateSinSignals(sections, len, fs);
    generated_datas = sin_signals .* envelopes;
    sound_data = SumWithoutExceptions(generated_datas);
    sound_data = sound_data * norm(data) / norm(sound_data);
    if (play_sound == 1)
        sound(sound_data, fs);
    end
end
    