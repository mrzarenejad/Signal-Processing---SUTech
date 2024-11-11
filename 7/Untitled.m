clear all; clc; close all;
N=512;
fs=10e3;
t=(0:N-1)*1/fs;
x=cos(2*pi*1e3*t);
snr_db=3; % dB
Ps=1/2;
snr=10^(snr_db/10);
Pn=Ps/snr;
noise=sqrt(Pn)*randn(1,N);
S=x+noise;
Sf=fft(S,N);
Sf=fftshift(abs(Sf));
f=(-N/2:N/2-1)*fs/N;
figure(1);
subplot(2,1,1);
plot(t,S);
subplot(2,1,2);
plot(f,Sf)