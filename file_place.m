function file_place(path,file_name,y_n,splices)
    if strcmp(y_n,'y')
        copyfile([path '/' file_name],[path '/keep_calls']);
        dest = [path '/keep_syll'];
        for k = 1:length(splices)
            j = int2str(k);
            syll = splices{k};
            new_file_name = [file_name strcat('_syll',j,'.mat')];
            save(new_file_name,'syll')
            movefile(new_file_name, dest);
        end
        
    else
        copyfile([path '/' file_name],[path '/keep_discard']);
    end
end
