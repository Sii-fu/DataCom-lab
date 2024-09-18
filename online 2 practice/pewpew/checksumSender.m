clc;
close all;

data=[7 11 12 0 6];
sumDec=sum(data);
sumBin=dec2bin(sumDec);
mainBin=sumBin(length(sumBin)-4+1:length(sumBin));
wrapBin=sumBin(1:length(sumBin)-4);
wrappedDec=bin2dec(mainBin)+bin2dec(wrapBin);
wrappedBin=dec2bin(wrappedDec,4);

checksum = '';
for i=1:1:4
    if wrappedBin(i)=='1'
        checksum = [checksum '0'];
    else
        checksum = [checksum '1'];
    end
end
checksum=bin2dec(checksum);
data=[data checksum];
disp(data);
save('checksum_sender.mat','data');


