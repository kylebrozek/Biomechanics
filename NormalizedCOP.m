clear
clc
close all

BASE = xlsread('17BASE.xlsx','Sheet1'); 
STAT = xlsread('17STAT.xlsx','Sheet1');
OF = xlsread('17OF.xlsx','Sheet1');

[LStepxB, LStepyB, LCOPLengthB, LCOPWidthB] = FunctionCOPLeft(BASE, 54.4311); 
[RStepxB, RStepyB, RCOPLengthB, RCOPWidthB] = FunctionCOPRight(BASE, 54.4311);

[LStepxS, LStepyS, LCOPLengthS, LCOPWidthS] = FunctionCOPLeft(STAT, 54.4311); 
[RStepxS, RStepyS, RCOPLengthS, RCOPWidthS] = FunctionCOPRight(STAT, 54.4311);

[LStepxO, LStepyO, LCOPLengthO, LCOPWidthO] = FunctionCOPLeft(OF, 54.4311); 
[RStepxO, RStepyO, RCOPLengthO, RCOPWidthO] = FunctionCOPRight(OF, 54.4311);


figure(1)
hold on
axis([-300 300 -50 350])
title('CoP Position - Baseline')
xlabel('ML Deviation (mm)') 
ylabel('AP Deviation (mm)')
plot(LStepxB(1:50:end,:),LStepyB(1:50:end,:),'r');

plot(RStepxB(1:50:end,:),RStepyB(1:50:end,:),'b');

figure(2)
hold on
axis([-300 300 -50 350])
title('CoP Position - Static')
xlabel('ML Deviation (mm)') 
ylabel('AP Deviation (mm)')
plot(LStepxS(1:50:end,:),LStepyS(1:50:end,:),'r');
plot(RStepxS(1:50:end,:),RStepyS(1:50:end,:),'b');


figure(3)
hold on
axis([-300 300 -50 350])
title('CoP Position - OF')
xlabel('ML Deviation (mm)') 
ylabel('AP Deviation (mm)')
plot(LStepxO(1:50:end,:),LStepyO(1:50:end,:),'r');
plot(RStepxO(1:50:end,:),RStepyO(1:50:end,:),'b');

meanLLB = nanmean(nonzeros(LCOPLengthB)) 
meanLWB = nanmean(nonzeros(LCOPWidthB))
meanRLB = nanmean(nonzeros(RCOPLengthB))
meanRWB = nanmean(nonzeros(RCOPWidthB))

meanLLS = nanmean(nonzeros(LCOPLengthS))
meanLWS = nanmean(nonzeros(LCOPWidthS))
meanRLS = nanmean(nonzeros(RCOPLengthS))
meanRWS = nanmean(nonzeros(RCOPWidthS))

meanLLO = nanmean(nonzeros(LCOPLengthO)) 
meanLWO = nanmean(nonzeros(LCOPWidthO))
meanRLO = nanmean(nonzeros(RCOPLengthO))
meanRWO = nanmean(nonzeros(RCOPWidthO))

[Means] = [meanLLB, meanLWB, meanRLB, meanRWB, meanLLS, meanLWS, meanRLS, meanRWS, meanLLO, meanLWO, meanRLO, meanRWO];