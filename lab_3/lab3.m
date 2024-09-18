clear all;
clc;
fs = 10000;
fm = 100;
t = 0:1/fs:1000/fs;

x = 5 * sin(2 * pi * 100 * t);
plot(t, x);


hold on;
y = [0];
xr = 0;
del = 0.4;

for i = 1:length(x) - 1
    if xr(i) <= x(i)
        d = 1;
        xr(i + 1) = xr(i) + del;
    else
        d = 0;
        xr(i + 1) = x(i) - del;
    end
    y = [y d];
end

stairs(t, xr);
title('Staircase Approximated Signal');
hold off

MSE = sum((x - xr).^2) / length(x);
disp(['Mean Squared Error (MSE): ', num2str(MSE)]);

figure;

%Delta modulation
subplot(3,1,1);
plot(t, y);
title('Delta modulated signal');

%Delta demodulation
subplot(3, 1, 2);
y_demod = [0];
xr_demod = 0;

for i = 2:length(y)
    if y(i) == 1
        xr_demod = xr_demod + del;
    else
        xr_demod = xr_demod - del;
    end
    y_demod = [y_demod xr_demod];
end

plot(t, y_demod);
title('Delta Demodulated Signal (Before Filtering)');

%apply filter

filter_order = 20;
lowpass_filter = fir1(filter_order, fm/(fs/2), 'low');
filter_signal = filter(lowpass_filter, 1, y_demod);


%plot the filteres demodulated signal
subplot(3,1,3);
plot(t, filter_signal);
title('Filtered Demodulated Signal');








