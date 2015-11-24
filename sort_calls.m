function sort_calls(path) %path must a string 

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
            y_n = input('Type y for keep, n for discard:','s');
            y_n = strtrim(y_n);
            while not(check_input(y_n))
                y_n=input('Please type y or n again:','s');
                y_n = strtrim(y_n);
            end
            file_place_old(path,file_name,y_n);
            close;
        end
      
        fprintf('All files sorted. \n ');
end
    









    
