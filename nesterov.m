function x_out = nesterov(A,y,t,tol,max_iter)
    N = size(A,2);
    alpha = 1;
    reduction = 0.5;

    xk = zeros(N,1);
    xk_prev = zeros(N,1);
    
    for iter = 0:max_iter
% Determine current beta value
        if iter == 0
            beta_k = 0;
        else
            beta_k = (iter - 1)/(iter + 2);
        end
% Y-Step
        yk = xk + beta_k*(xk-xk_prev);
% Calculation of nabla f
        grad_f = A' * (A * yk - y);
% X-Step
        xk_next = projectL1Ball((yk - alpha * grad_f),t);
% Determine alpha value
        while true
            LHS = 0.5 * norm(y - A*xk_next)^2;
            RHS = 0.5 * norm(y - A*yk)^2 + dot(grad_f,xk_next - yk) + (1/(2*alpha))*norm(xk_next - yk)^2;
            if LHS <= RHS
                break;
            end
            alpha = alpha * reduction;
            xk_next = projectL1Ball((yk - alpha * grad_f),t);
        end
        xk_prev = xk;
        xk = xk_next;
% Test for tolerance
        if norm(xk-xk_prev)<tol
            break;
        end
    end
    x_out = xk;
end