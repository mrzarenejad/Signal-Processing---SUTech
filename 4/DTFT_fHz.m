clear all; clc; close all;
fs=100e3;
ts=1/fs;
N=1000;
n=0:N-1;
t=n*ts;
f0=10e3;
x1=10*cos(2*pi*f0*t);
w0=2*pi*f0/fs;
x2=10*cos(w0*n);
figure(1);
subplot(2,1,1);
plot(t,x1);
subplot(2,1,2);
plot(n,x2)
w=-pi:0.001:pi;
nt=n';
A=exp(-1i*nt*w);
Xw=x1*A; Xw=abs(Xw);
figure(2);
subplot(2,1,1);
plot(w,Xw)
f=w*fs/(2*pi);
subplot(2,1,2);
plot(f,Xw);