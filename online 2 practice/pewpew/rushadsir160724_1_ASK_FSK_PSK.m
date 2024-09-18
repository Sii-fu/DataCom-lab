clc;
clear;
close all;

data = [1 0 1 1 0 1 0 1]; %digital signal
bp = 0.00001; %bit period kom hoile beshi data pathaite parbo

bit = [];                                                              

for i=1:1:length(data)
    if data(i) == 1
        se = ones(1, 100); %signal element e 100 ta 1 store hobe for bit 1
    else
        se = zeros(1, 100);
    end
    bit = [bit se];
end

t = bp/100:bp/100:bp*length(data);

subplot(5,1,1);
plot(t, bit, 'Linewidth', 2); %darker lines
axis([0, bp*length(data), -1, 2]); %first-neg x side er val ,second x er positive side, third y er neg side fourth y er pos side
title('Digital Signal');

%ASK

A0 = 0;
A1 = 5;
f = 10/bp; %not 1/bp,carrier analog er jonno f ektu beshi nilam
t2 = bp/100:bp/100:bp; % prottekta single bit erjonno 100 ta points

st = [];

for i=1:1:length(data)
    if data(i) == 1
        y = A1 * sin(2*pi*f*t2);
    else
        y = A0 * sin(2*pi*f*t2);
    end
    st = [st y];
end

subplot(5,1,2);
plot(t, st, 'Linewidth', 2);
axis([0, bp*length(data), -10, 10]);
title('ASK Signal');

%FSK

A = 3;
f1 = 10/bp;
f0 = 2/bp;
t2 = bp/100:bp/100:bp;

st = [];

for i=1:1:length(data)
    if data(i) == 1
        y = A * sin(2*pi*f1*t2);
    else
        y = A * sin(2*pi*f0*t2);
    end
    st = [st y];
end

subplot(5,1,3);
plot(t, st, 'Linewidth', 2);
axis([0, bp*length(data), -10, 10]);
title('FSK Signal');

%PSK
A = 5;
f = 10/bp;
t2 = bp/100:bp/100:bp;

st = [];

for i=1:1:length(data)
    if data(i) == 1
        y = A * sin(2*pi*f*t2);
    else
        y = -A * sin(2*pi*f*t2);
    end
    st = [st y];
end

subplot(5,1,4);
plot(t, st, 'Linewidth', 2);
axis([0, bp*length(data), -10, 10]);
title('PSK Signal');

%two data in one level
A = 5;
f = 10/bp;
t2 = bp/100:bp/100:2*bp;

st = [];

for i=1:2:length(data)-1
    if data(i) == 1 && data(i+1) == 1
        y = A * sin(2*pi*f*t2);
    elseif data(i) == 1 && data(i+1) == 0
        y = A * cos(2*pi*f*t2);
    elseif data(i) == 0 && data(i+1) == 1
        y = -A * sin(2*pi*f*t2);
    elseif data(i) == 0 && data(i+1) == 0
        y = -A * cos(2*pi*f*t2);
    end
    st = [st y];
end

subplot(5,1,5);
plot(t, st, 'Linewidth', 2);
axis([0, bp*length(data), -10, 10]);
title('PSK Signal for two data elements ');






