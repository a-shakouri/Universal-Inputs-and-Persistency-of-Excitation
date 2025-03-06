function [B,x0] = U2ABX(input,m,n,L,A,zeta)

T=length(input)/m;

if T~=floor(T)
    msg = "The length of input signal must be divisable by 'm'.";
    error(msg) 
end

U1=reshape(input,m,T);

H=Hankel(U1,n+L);

Eta=null(H');

check=min(size(null(H')));

if rank(ctrb(A,zeta))~=n 

    msg = "Uncontrollability problem! Choose a different A and/or zeta.";
    error(msg)
    
end

if check==0
    msg = "The input is PE!";
    error(msg)
end

eta=reshape(Eta(:,1),m,n+L);

en=zeta;

x0=zeros(n,1);

E=zeros(n,m);

for i=n+L:-1:2
        
    E=A*E+en*eta(:,i)';
    
    x0=x0-E*U1(:,i-1);
    
end

B=A*E+en*eta(:,1)';

end

