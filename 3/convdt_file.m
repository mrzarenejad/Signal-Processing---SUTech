clear all; clc;
N1=10;
N2=5;
n1=-N1:N1;
y1=stp(n1,-N2)-stp(n1,N2+1);
figure(1);
subplot(3,1,1);
stem(n1,y1);
y2=stp(n1,-N2)-stp(n1,N2+1);
subplot(3,1,2);
stem(n1,y2);
y3=conv(y1,y2);
n2=-(N1+N1):N1+N1;
subplot(3,1,3);
stem(n2,y3);
grid on
