function keep_dur=dur_histogram(path)
    d = dir([path '/*.mat']);
    d_len = length(d);
    vec_lengths = [];
    fs = 250000;
    for k = 1:d_len
        file_name = d(k).name;
        vec = load(file_name);
        vec_len = length(vec.syll)/fs;
        vec_lengths = [vec_lengths;vec_len];
    end
    histogram(vec_lengths,length(vec_lengths));
    title('Historgram of Vector Lengths');
    xlabel('Duration (sec)');
    ylabel('# of calls');
    high_prctile = prctile(vec_lengths,97.5);
    low_prctile = prctile(vec_lengths,2.5);
    keep_dur = (high_prctile - low_prctile)*fs; %duration of call in samples
end