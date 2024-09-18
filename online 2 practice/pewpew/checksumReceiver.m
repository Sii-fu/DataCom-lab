load('checksum_sender.mat');
sumDec=sum(data);
sumBin=dec2bin(sumDec);
mainBin=sumBin(length(sumBin)-4+1:length(sumBin));
wrapBin=sumBin(1:length(sumBin)-4);
wrappedDec=bin2dec(mainBin)+bin2dec(wrapBin);
wrappedBin=dec2bin(wrappedDec,4);

checksum = '';
for i=1:1:4
    if wrappedBin(i)=='1'
        checksum=[checksum '0'];
    else
        checksum=[checksum '1'];
    end
end
checksum=bin2dec(checksum);
if checksum == 0
    disp('There is no error');
else
    disp('Error in transmission');
end
    