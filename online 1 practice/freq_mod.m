clear all;
clc;

fs=50000;
N=3000;
t=(0:1/fs:(N-1)/fs);

Am=2;
fm=100;
M_sig=Am*cos(2*pi*fm.*t);

Ac=1;
fc=200;
Mod_sig=Ac*cos(2*pi*fc.*t+50*M_sig);

figure;
subplot(3,1,1);
plot(t,M_sig);
title("message signal");

subplot(3,1,2);
plot(t,Mod_sig);
title("Mod Signal");



rec_sig=abs(Mod_sig);

subplot(3,1,3);
plot(t,rec_sig);
title("Rec Signal");

fcut=500;

order=5;
myquist_freq=fs/2;
normalize_cutoff_freq=fcut/myquist_freq;
[b,a]=butter(order,normalize_cutoff_freq, 'low');

flt_sig=filter(b,a,rec_sig);
figure;
subplot(1,1,1);
plot(t,flt_sig);
title("flt Signal");

