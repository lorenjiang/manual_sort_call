function file_place_old(path,file_name,y_n)
    if strcmp(y_n,'y')
        copyfile([path '/' file_name],[path '/keep_calls']);
        
    else
        copyfile([path '/' file_name],[path '/discard_calls']);
    end
end
