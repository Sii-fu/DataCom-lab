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
title('CAREER signal')
grid on;

kf=25;
mod_sig=Ac*sin(2*pi*fc.*t+kf*msg_sig);

subplot(5,1,3);
plot(t,mod_sig);
title('MOD signal')
grid on;

demod_sig=[diff(mod_sig) 0]*fs;

rec_signal=abs(demod_sig);

subplot(5,1,4);
plot(t,rec_signal);
title('RECTIFIED signal')
grid on;

cutoff_freq=20;
order=4;
nyquist_freq=fs/2;
normalize_cutoff_freq=cutoff_freq/nyquist_freq;

[b,a]=butter(order,normalize_cutoff_freq,'low');

filtered_sig=filter(b,a,rec_signal);


subplot(5,1,5);
plot(t,filtered_sig);
title('FILTERED signal')
grid on;

