clear all;
clc;

%time parameter
fs = 1000; %sampling frequency
t = linspace (0,1,1000);

%message signal parameters
fm = 10; 
Am = 1;

message_signal = Am*sin(2*pi*fm.*t);

%carrier signal parameters
fc = 100;
Ac = 2;

carrier_signal = Ac*sin(2*pi*fc.*t);

% frequency daviation constant
kf =25;

%perform frequency modulation (FM)
modulated_signal = Ac * sin(2*pi*fc.*t+kf*message_signal);


%plotting
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

%demodulation


% 1. rectification process
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


% 2.low pass filter
cutoff_freq = 20;

order = 5;
myquist_freq = fs/2;
normalize_cutoff_freq = cutoff_freq / myquist_freq;
[b,a] = butter(order, normalize_cutoff_freq, 'low');

%apply the lowpass filter to the rectified signal
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




