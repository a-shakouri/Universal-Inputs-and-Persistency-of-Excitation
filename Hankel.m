function Yk = Hankel(Y0,k)

[~,m]=size(Y0);

T=m;

Yk=kron(eye(k),Y0)*Q_mat(T,k-1);

end

