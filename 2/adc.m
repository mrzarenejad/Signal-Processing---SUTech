%_______________signal defenition in time domain (input)___________________

clear all; clc;
fs=448e3;
fin=175e3;
t=0:1/fs:100e-6;
xt=1.25*cos(2*pi*fin*t);
figure(1); 

stem(t,xt); 
grid on; xlabel(' t '); ylabel(' cos(2*pi*fin*t)  ');

%__________________ sampling,quantizing and bit generation_________________

Nx=10;
xd=xt(1:Nx);
a=1.25;
n=12;
N=2^12;
delta=(2*a)/N;
q=linspace(-a-delta/2,a-delta/2,N+1);
for j=1:Nx
for i=1:N;
    if (xd(j)<=q(i+1))&(xd(j)>q(i))
        xq(j)=q(i)+delta/2;
        nl=i;
    break;
    end
end
if xd(j)<=q(1)
    xq(j)=q(1)+delta/2;
    nl=1;
elseif xd(j)>q(N+1)
    xq(j)=q(N+1)-delta/2;
    nl=N;
end

b(j,1:12)=dec2bin(nl-1,12);

end
for j=1:Nx;
    fprintf(' sample(%i) is : %s  \n',j,b(j,:));
end