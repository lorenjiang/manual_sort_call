function manual_process(path,file_name,y,fs,ax) %allows user to manually select calls/syllables
    y_n = input('Type y for keep (you will be prompted to splice the call), n for discard:','s');
    y_n = strtrim(y_n);
    
    while not(check_input(y_n))
        y_n=input('Please type y or n again:','s');
        y_n = strtrim(y_n);
    end
    
    if strcmp(y_n,'y') 
        x=pick_pts(ax);
        lines=make_lines(x,ylim);
        kept=keep_intervals(ax,lines,x);
        splices=vec_splice(y,kept,fs);
        
    else
        splices = {};
        
    end
    close;
    file_place(path,file_name,y_n,splices);
    
end

function output=keep_intervals(ax,lines,x)
    y_n = input('Keep these intervals?','s');
    while not(check_input(y_n))
        y_n=input('Please type y or n again:','s');
        y_n = strtrim(y_n);
    end
    while strcmp(y_n,'n')
        delete(lines);
        output = pick_pts(ax);
        lines=make_lines(output, ylim);
        y_n = input('Keep these intervals?','s');
    end
    if strcmp(y_n,'y')
        output = x;
    end
end


function x_times=pick_pts(ax)
    [x_times,y_vals]=ginput;
    num_points = length(x_times);
    x_times = sort(x_times);
    
    while not(in_bounds(ax,x_times,y_vals));
        fprintf('You chose a coordinate out of bounds. Please pick again. \n');
        [x_times,y_vals]=ginput;
        x_times = sort(x_times);
        
    end
    
    while not(mod(num_points,2)==0) 
            fprintf('Please select an EVEN number of points. \n');
            [x_times,y_vals]=ginput;
            x_times = sort(x_times);
            num_points = length(x_times);
    end
end

function bool=in_bounds(ax,x_vals,y_vals) 
    axes(ax);
    xl =xlim; yl = ylim;
    upper_bound_x = (x_vals >= xl(2)); lower_bound_x = (x_vals <= xl(1));
    upper_bound_y = (y_vals >= yl(2)); lower_bound_y = (y_vals <= yl(1));
    if any(upper_bound_x)||any(lower_bound_x)||any(upper_bound_y)||any(lower_bound_y)
        bool = 0; % x_vals or y_vals are out of bounds
    else
        bool = 1; % x_vals and y_vals are in bounds
    end
end



function lines=make_lines(x_vals, ylim) %# of x_vals should be even
    lines = [];
    
    for j = 1:(length(x_vals)/2)
            if mod(j,2) == 0
                color_val = [1 0 0]; %red
            else
                color_val = [0 1 1]; %cyan
            end
            l1 = line([x_vals(2*j-1) x_vals(2*j-1)], ylim,'color',color_val);
            l2 = line([x_vals(2*j) x_vals(2*j)], ylim,'color',color_val);
            lines = [lines l1 l2];
    end
end




