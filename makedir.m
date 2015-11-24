function makedir(path_name) %makes dir keep_calls, discard_calls, and keep_syll if they do not exist already
    if not(exist([path_name '/keep_calls'],'dir') && exist([path_name '/discard_calls'],'dir') && exist([path_name '/keep_syll'],'dir'))
            mkdir(path_name,'keep_calls'); mkdir(path_name,'discard_calls'); mkdir(path_name,'keep_syll');
    end
end