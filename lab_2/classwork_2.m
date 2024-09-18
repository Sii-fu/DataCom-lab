clear all;
clc;

%time parameter
fs = 1000; %sampling frequency
t = linspace (0,30,1000);

fm = 0.1; 
Am = 500;

message_signal = Am*sin(2*pi*fm.*t);

fc = 100000;
Ac = 1;

carrier_signal = Ac*sin(2*pi*fc.*t);

kf =50;

modulated_signal = Ac * sin(2*pi*fc.*t+kf*message_signal);

figure;
subplot(2, 1, 1);
plot(t,message_signal);
title('Message Signal');
xlabel('Time(s)');
ylabel('Frequency');
grid on;

subplot(2, 1, 2);
plot(t,modulated_signal);
title('modulated Signal');
xlabel('Time(s)');
ylabel('Frequency');
grid on;



rectified_signal = abs(modulated_signal);

figure;
subplot(2, 1, 1);
plot(t,modulated_signal);
title('Modulated Signal');
xlabel('Time(s)');
ylabel('Frequency');
grid on;

subplot(2, 1, 2);
plot(t,rectified_signal);
title('Rectified Signal');
xlabel('Time(s)');
ylabel('Frequency');
grid on;

cutoff_freq = 15;
order = 4;
myquist_freq = fs/2;
normalize_cutoff_freq = cutoff_freq / myquist_freq;
[b,a] = butter(order, normalize_cutoff_freq, 'low');

filtered_signal = filter(b,a,rectified_signal);

%plotting

subplot(2, 1, 1);
plot(t,rectified_signal);
title('rectified Signal');
xlabel('Time(s)');
ylabel('Frequency');
grid on;
subplot(2, 1, 2);
plot(t,filtered_signal);
title('filtered Signal');
xlabel('Time(s)');
ylabel('Frequency');
grid on;