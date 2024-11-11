clear all; clc
[y1,fs]=audioread('singing.wav');
figure(1)
subplot(2,1,1); 
plot(y1); 
n=length(y1);
n=2^nextpow2(n);
f=(-n/2:n/2-1)*fs/n;
y21=fft(y1,n)/n;
y21=abs(y21);
y21=fftshift(y21);
subplot(2,1,2)
plot(f,y21);
sound(y1,fs); pause(5);
%_______________________ 0.3 second echo generation _______________________
delay=round(fs*0.3); c=0.5;
b=[1,zeros(1,delay-1),c];
y3=filter(b,1,y1);
sound(y3,fs); pause(5);
%__________________________________________________________________________
y4=filter(1,b,y3);
sound(y4,fs); pause(5);
%__________________________________________________________________________