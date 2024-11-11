clear all; clc
fs=10e3;
ts=1/fs;
N=512;
t=(0:N-1)*ts;
f1=1e3;
f2=2e3;
f3=3e3;
x1=sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t);
figure(1)
plot(t,x1)
x1f=fft(x1,N)/N;
x1f=abs(x1f);
f=(0:N-1)*fs/N;
figure(2)
plot(f,x1f);
% filter 1
wp1=1.1e3/(fs/2);
ws1=1.5e3/(fs/2);
Ap1=1;
As1=60;
[n1,wn1]=buttord(wp1,ws1,Ap1,As1);
[b1,a1]=butter(n1,wn1);
[h1,w1]=freqz(b1,a1,1000);
w2=w1*fs/(2*pi);
figure(3); plot(w2,abs(h1))
x2=filter(b1,a1,x1);
x2f=fft(x2,N)/N;
x2f=abs(x2f);
figure(4)
plot(f,x2f);
% filter 2
wp2=[1.8e3 2.2e3]/(fs/2);
ws2=[1.5e3 2.5e3]/(fs/2);
Ap2=1;
As2=60;
[n2,wn2]=buttord(wp2,ws2,Ap2,As2);
[b2,a2]=butter(n2,wn2);
[h2,w2]=freqz(b2,a2,1000);
figure(5); plot(w2,abs(h2))
x3=filter(b2,a2,x1);
x3f=fft(x3,N)/N;
x3f=abs(x3f);
figure(6)
plot(f,x3f);
% filter 3
wp3=2.8e3/(fs/2);
ws3=2.6e3/(fs/2);
Ap3=1;
As3=60;
[n3,wn3]=buttord(wp3,ws3,Ap3,As3);
[b3,a3]=butter(n3,wn3,'high');
[h3,w3]=freqz(b3,a3,1000);
figure(7); plot(w3,abs(h3))
x4=filter(b3,a3,x1);
x4f=fft(x4,N)/N;
x4f=abs(x4f);
figure(8)
plot(f,x4f);