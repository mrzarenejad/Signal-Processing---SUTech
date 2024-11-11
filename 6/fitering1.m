clear all; clc; close all;
load IIRfil; load FIRfil;
nfil=-10:200;
hIIR=impz(bIIR,aIIR,nfil);
hFIR=impz(bFIR,1,nfil);
figure(1);
subplot(2,1,1);
stem(nfil,hIIR);
xlabel(' sample number ');
ylabel(' IIR filter impulse response ');
subplot(2,1,2);
stem(nfil,hFIR);
xlabel(' sample number ');
ylabel(' FIR filter impulse response ');
IIR_trans=132;
FIR_trans=length(bFIR)-1;
% -------------------------------------------------------------------------
fs=10e3;
ts=1/fs;
N=300;
n=0:N-1;
t=n*ts;
f1=1e3; f2=3e3;
x1=cos(2*pi*f1*t)+cos(2*pi*f2*t);
figure(2);
plot(t,x1);
xlabel(' time (second) ');
ylabel(' Input Signal amplitude ');
% --------------------------- outputs of Filters --------------------------
x2=filter(bIIR,aIIR,x1);
x3=filter(bFIR,1,x1);
figure(3);
subplot(2,1,1);
plot(t,x2);
xlabel(' time (second) ');
ylabel(' Amplitude ');
title(' IIR output Signal ');
subplot(2,1,2);
plot(t,x3);
xlabel(' time (second) ');
ylabel(' Amplitude ');
title(' FIR output Signal ');
% -------------------------------------------------------------------------
x22=x2(IIR_trans+1:end);
t22=t(IIR_trans+1:end);
x32=x3(FIR_trans+1:end);
t32=t(FIR_trans+1:end);
figure(4);
subplot(2,1,1);
plot(t22,x22);
xlabel(' time (second) ');
ylabel(' Amplitude ');
title(' IIR output Signal after transition removing ');
subplot(2,1,2);
plot(t32,x32);
xlabel(' time (second) ');
ylabel(' Amplitude ');
title(' FIR output Signal after transition removing ');