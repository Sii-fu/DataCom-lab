clear all;
clc;

fs=1000;
t=0:0.001:1;

fm=10;Am=1;
msg_sig=Am*sin(2*pi*fm.*t);

subplot(5,1,1);
plot(t,msg_sig);
title('Msg signal')
grid on;

fc=100;Ac=2;
car_sig=Ac*sin(2*pi*fc.*t);

subplot(5,1,2);
plot(t,car_sig);
title('career signal')
grid on;

mod_sig=(1+msg_sig).*car_sig;


subplot(5,1,3);
plot(t,mod_sig);
title('MOD signal')
grid on;

%Demodulation

Rec_sig=abs(mod_sig);


subplot(5,1,4);
plot(t,Rec_sig);
title('Rectified signal')
grid on;

cutoff_freq=20;

order=4;

nyquest_freq=fs/2;

normalized_cutoff_freq=(cutoff_freq/nyquest_freq);

[b,a]=butter(order,normalized_cutoff_freq,"low");

filtered_sig=filter(b,a,Rec_sig);


subplot(5,1,5);
plot(t,filtered_sig);
title('FILTERED signal')
grid on;

