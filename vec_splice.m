function vec_splices = vec_splice(vec,times,fs) %takes an array of time intervals and splices the vector accordingly; returns cell array of vectors
    k=1; i = 1;
    num_splices = length(times)/2;
    vec_splices = cell(1,num_splices);
    while k < length(times)
        t_1 = round(times(k)*fs);
        t_2 = round(times(k+1)*fs);
        new_vec = vec(t_1:t_2);
        vec_splices{i} = new_vec;  
        k = k + 2; %iterating over odd indices
        i = i + 1;
    end
    
end
