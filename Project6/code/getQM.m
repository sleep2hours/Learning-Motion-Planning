function [Q, M] = getQM(n_seg, n_order, ts)
    Q = [];
    M = [];
    M_k = getM(n_order);
    for k = 1:n_seg
        Q_k = zeros(n_order+1,n_order+1);
        for i=4:n_order
            for j=4:n_order
                Q_k(i+1,j+1)=i*(i-1)*(i-2)*(i-3)*j*(j-1)*(j-2)*(j-3)/(i+j-7)*ts(k)^(i+j-7);
            end
        end
        Q = blkdiag(Q, Q_k);
        M = blkdiag(M, M_k);
    end
end