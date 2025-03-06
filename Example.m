clear all;clc

tic

T=10;
m=2;
n=3;
L=1;

input=random('uniform',-2,2,T*m,1); %Choose your input signal

u=reshape(input,m,T); %Reshaping the input signal into depth 1 Hankel matrix

A=random('uniform',-3,3,n,n); %Choose matrix A
    
zeta=random('uniform',-1,1,n,1);%Choose vector zeta

[B,x0] = U2ABX(input,m,n,L,A,zeta); %Here is your B and x0

x(:,1)=x0;

for t=1:T
    
    x(:,t+1)=A*x(:,t)+B*u(:,t); %Trajectory simulation
    
end

D=[Hankel(x(:,1:T-L+1),1);Hankel(u,L)]; %Data matrix

check=min(svd(D)); %Check the rank deficiency of D
    
if check>1e-6
    
    msg = "There is a problem: Try choosing a different A!";
    error(msg)

else
    
disp('The algorithm was successful!');
A
B
x0

end

toc