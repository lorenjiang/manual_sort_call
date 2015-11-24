function sort_callsplice(path) %path must a string 

        d = dir([path '/*.wav']);
        if length(d) == 0
            fprintf('No wav files found in directory. Check your typing.\n')
            return
        end
        makedir(path);
        d_keep = length(dir([path '/keep_calls/*.wav'])); d_discard = length(dir([path '/discard_calls/*.wav']));
        num_files = d_keep + d_discard;
        for k = num_files+1:length(d)
            file_name = d(k).name;
            [y, fs] = audioread([path '/' file_name]);
            t= 0:1/fs:(length(y)-1)/fs;
            [ax,fig]=make_plots(y,t,fs,file_name);
            manual_process(path,file_name,y,fs,ax); 
        end
      
        fprintf('All files sorted. \n ');
end
    









    
