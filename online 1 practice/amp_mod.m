clear all;
clc;
close all;

fs=5000;
n=1000;
t=(0:1/fs:(n-1)/fs);

fm=50;
am=1;

M_sig=am*cos(2*pi*fm.*t);


fc=500;
ac=2;
mu=0.5;
mod_sig=ac*(1+mu*(M_sig/am)).*cos(2*pi*fc.*t);

figure;
subplot(2,1,1);
plot(t,M_sig);
title("message");

subplot(2,1,2);
plot(t,mod_sig);
title("MOd sig");

rec_sig=abs(mod_sig);

figure;

subplot(2,1,1);
plot(t,rec_sig);
title("rectified");



fcut=200;
order=5;
mq=fs/2;
norm=fcut/mq;
[b,a]=butter(order,norm,'low');
filter_sig=filter(b,a,rec_sig);


subplot(2,1,2);
plot(t,filter_sig);
title("Filtered sig");