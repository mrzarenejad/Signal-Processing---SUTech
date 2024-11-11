%_______________signal defenition in time domain (input)___________________

clear all; clc;
fs=1e6;
fin=100e3;
t=0:1/fs:10e-6;
xt=cos(2*pi*fin*t);
figure(1); 

stem(t,xt); 
grid on; xlabel(' t '); ylabel(' cos(2*pi*fin*t)  ');

%__________________ sampling,quantizing and bit generation_________________

Nx=5;
xd=xt(1:Nx);
a=1;
n=8;
N=2^n;
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

b(j,1:n)=dec2bin(nl-1,n);

end
for j=1:Nx;
    fprintf(' sample(%i) is : %s  \n',j,b(j,:));
end
c=b.';
c=c(:).';
t=0:1/fs:4e-3;
ystp=stp(t,0)-stp(t,1e-3+1/fs);
Lc=length(c);
yout=[];
for k=1:Lc
    if c(k)=='1'
        yout=[yout,ystp];
    elseif c(k)=='0'
        yout=[yout,-ystp];
    end
end
tout=0:1/fs:Lc*(4e-3)+(Lc-1)*1/fs;
figure(2);
plot(tout,yout);
xlabel(' time ');
ylabel( 'modulated signal amplitude ');