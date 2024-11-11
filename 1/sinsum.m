function x=sinsum(t,ak)
N=length(ak);
k=(1:N)';
t=t(:)';
ak=ak(:)';
x=ak*sin(2*pi*k*t);
end