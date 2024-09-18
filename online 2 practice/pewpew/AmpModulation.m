clear all;
clc;
%time parameter
fs=1000;
t=0:0.001:1;  %t=linspace(0,1,1000);   %time vector
%message signal parameter
fm=10; % message signal freq
Am=1; % message signal amp
message_signal= Am*sin(2*pi*fm.*t);


%carrier signal parameter
fc=100; %carrier signal freq
Ac=2; %carrier signal amp
carrier_signal=Ac*sin(2*pi*fc.*t);

%modulated signal
modulated_signal=(1+message_signal).*carrier_signal;

%demodulation

%1.rectification
rectified_signal=abs(modulated_signal);

%2.low pass filter
%low pass filter parameter
cutoff_freq=20;
%design
order=4;  %filter order
nyquist_freq=fs/2;
normalized_cutoff_freq=cutoff_freq/nyquist_freq;
[b,a]=butter(order,normalized_cutoff_freq,'low');

%apply the low pass filter to the rectified signal
filtered_signal=filter(b,a,rectified_signal);

%plotting

subplot(5,1,1);
plot(t,message_signal);
title('Message signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
subplot(5,1,2);
plot(t,carrier_signal);
title('Carrier signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

subplot(5,1,3);
plot(t,modulated_signal);
title('Modulated signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;

subplot(5,1,4);
plot(t,rectified_signal);
title('Rectified signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;
subplot(5,1,5);
plot(t,filtered_signal);
title('Filtered signal');
xlabel('Time(s)');
ylabel('Amplitude');
grid on;









