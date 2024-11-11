clear all; clc; close all;
N=3;
fs=1000;
t=0:1/fs:5;
ak=[5 10 -6];
y=sinsum(t,ak);
figure(1);
plot(t,y)