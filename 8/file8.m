clear all; clc; close all;
fs=10e3;
ts=1/fs;
N1=200;
n=0:N1-1;
t=n*ts;
f0=2e3;
x1=2*cos(2*pi*f0*t);
figure(1);
plot(t,x1);
xlabel(' time (sec) ');
ylabel(' Amplitude ');
N2=4096;
x1f=fft(x1,N2);
x1f=fftshift(abs(x1f));
f=(-N2/2:N2/2-1)*fs/N2;
figure(2);
subplot(2,1,1);
plot(f,x1f);
xlabel(' freq (Hz) ');
ylabel(' Amplitude ');
x1f_db=20*log10(x1f/max(x1f));
subplot(2,1,2);
plot(f,x1f_db);
xlabel(' freq (Hz) ');
ylabel(' Amplitude (dB) ');
% -------------------------------------------------------------------------
% window effect
% -------------------------------------------------------------------------
% 1st: hamming
w1=hamming(N1)';
x2=x1.*w1;
figure(3);
plot(t,x2);
x2f=fft(x2,N2);
x2f=fftshift(abs(x2f));
figure(4);
subplot(2,1,1);
plot(f,x2f);
xlabel(' freq (Hz) ');
ylabel(' Amplitude ');
title(' hamming ');
x2f_db=20*log10(x2f/max(x2f));
subplot(2,1,2);
plot(f,x2f_db);
xlabel(' freq (Hz) ');
ylabel(' Amplitude (dB) ');
title(' hamming ');
% --------------------------------
% 2nd: kaiser
As=100;
beta=0.1102*(As-8.7);
w2=kaiser(N1,beta)';
x3=x1.*w2;
figure(5);
plot(t,x3);
x3f=fft(x3,N2);
x3f=fftshift(abs(x3f));
figure(6);
subplot(2,1,1);
plot(f,x3f);
xlabel(' freq (Hz) ');
ylabel(' Amplitude ');
title(' kaiser (100dB) ');
x3f_db=20*log10(x3f/max(x3f));
subplot(2,1,2);
plot(f,x3f_db);
xlabel(' freq (Hz) ');
ylabel(' Amplitude (dB) ');
title(' kaiser (100dB) ');