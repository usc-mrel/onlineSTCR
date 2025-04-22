function alpha = line_search_binary(nmaxiter, cost_fun, x, s, alpha_init)

 % 
    alpha   = alpha_init;        % Initial Step size
    cost_down = cost_fun(x, 0);
    cost_old = cost_down;
    
    alpha_old = 0;
    alpha_down = 0;
    alpha_up = 1;
    iter = 1;
    
    x_temp      = x + alpha * s;
    cost_temp   = cost_fun(x_temp, 0);
    if cost_temp.totalCost<cost_old.totalCost
        alpha = alpha*2;
        flag_inc = true;        
    else
        alpha = alpha/2;
        flag_inc = false;
    end
    fprintf(sprintf('line %5.0f%10.5f\n',iter,alpha));
    
    iter = 2;
    
    while iter < nmaxiter
        x_temp      = x + alpha * s;
        cost_temp   = cost_fun(x_temp, 0);
        if cost_temp.totalCost<cost_old.totalCost
            if flag_inc
                alpha_old = alpha;
                alpha = alpha*2; 
                cost_old = cost_temp;
            else
                alpha_down = 0;
                alpha_up = alpha_old;
                cost_up = cost_old;
                cost_old = cost_temp;
                break
            end
        else
            if ~flag_inc
                alpha_old = alpha;
                alpha = alpha/2;
                cost_old = cost_temp;
            else
                alpha_up = alpha;
                alpha = alpha_old;
                alpha_down = 0;
                cost_up = cost_temp;
                cost_old = cost_old;
                break
            end
        end
        fprintf(sprintf('line %5.0f%10.5f\n',iter,alpha));
        iter = iter+1;
        
    end
    
    
    fprintf(sprintf('line %5.0f%10.5f%10.5f%10.5f\n',iter,alpha_down, alpha,alpha_up));
    while iter < nmaxiter        
        alpha_temp_down = (alpha+alpha_down)/2;
        x_temp = x + alpha_temp_down * s;
        cost_temp_down = cost_fun(x_temp, 0);
        
        if cost_temp_down.totalCost < cost_old.totalCost
            alpha_up = alpha;
            alpha = alpha_temp_down;
            cost_up = cost_old;
            cost_old = cost_temp_down;
            flag_out = 1;
        else
            alpha_temp_up = (alpha+alpha_up)/2;
            x_temp = x + alpha_temp_up * s;
            cost_temp_up = cost_fun(x_temp, 0);
            if cost_temp_up.totalCost < cost_old.totalCost
                alpha_down = alpha;
                alpha = alpha_temp_up;
                cost_down = cost_old;
                cost_old = cost_temp_up;
                flag_out = 2;
            else
                alpha_up = alpha_temp_up;
                alpha_down = alpha_temp_down;
                cost_up = cost_temp_up;
                cost_down = cost_temp_down;
                flag_out = 3;
            end

            
        end
        
        fprintf(sprintf('line %5.0f%10.5f%10.5f%10.5f%10.0f\n',iter,alpha_down, alpha,alpha_up,flag_out));
        iter = iter+1;
    end
        
end