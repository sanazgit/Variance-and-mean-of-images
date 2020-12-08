originalImage= imread('pic1.png');

[m,n,z]= size(originalImage);

br=floor(m/2.5);
bc=floor(n/2.5);

blockSize = [br ,bc];

varFilterFunction = @(theBlockStructure) var(double(theBlockStructure.data(:)));
blockyImagevar = blockproc(originalImage, blockSize, varFilterFunction);
varianceImage=blockyImagevar(:);
display(varianceImage);

meanFilterFunction = @(theBlockStructure) mean(double(theBlockStructure.data(:)));
blockyImagemean = blockproc(originalImage, blockSize, meanFilterFunction);
meanImage=blockyImagemean(:);
display(meanImage);

cor=corrcoef(varianceImage,meanImage);
cor(isnan(cor))=0;

s=size(cor);
sum=0;
for nn=1:s(1)
    for mm=1:s(2)
        sum=sum+cor(nn,mm);
    end
end
sum;
final=sum/(s(1)*s(2))

display(final);

figure
plot(varianceImage,'*c');
hold on
plot (meanImage,'or');
hold on
plot (final,'sb');
grid
title('My picture');
legend('Variance','mean','corrolation');


