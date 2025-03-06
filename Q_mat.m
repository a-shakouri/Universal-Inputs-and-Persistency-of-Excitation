function Q = Q_mat(T,k)

Q=[];

for i=0:k
    
    Q=[Q;Qi(i,k,T)];

end

