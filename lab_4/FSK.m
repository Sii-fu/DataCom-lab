% Amplitude Shift Keying (ASK) Modulation

clc;
clear;
close all;

Data = [1 0 1 1 0 1 0 1];

bp = 0.00001;

bit = [];

for i = 1:1:length(Data)
    if Data(i) == 1
        se  = ones(1, 100);
    else
        se = zeros(1, 100);
    end
    bit = [bit se];
end

t1 = bp/100 : bp/100 : length(Data)*bp;

subplot(3, 1, 1);
plot(t1, bit, 'lineWidth', 1.5);
axis([0,length(Data)*bp,0,2])

st = [];
A=1;

f1= 10/bp;
f0= 5/bp;
t2 = bp/100 : bp/100 : bp;

for i=1:1:length(Data)
    if Data(i)==1
        y=A*sin(2*pi*f1*t2);
    else
        y=A*sin(2*pi*f0*t2);
    end
    st = [st,y];
end

subplot(3, 1, 2);
plot(t1, st, 'lineWidth', 1.5);
axis([0,length(Data)*bp,-1.5,1.5])
