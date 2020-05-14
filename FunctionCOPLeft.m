function [LeftStepx, LeftStepy, LCOPLength, LCOPWidth] = FunctionCOPLeft(HEELDATA, BW) 
%% %% %% %% %%
%1. Low-Pass filter (30hz)
%2. Find GRFz for Left, right, and double-support phases (3 separate)
%3. Normalize GRF to subjects' BW
%4. Find Peaks of vertical GRF during
%   double-limb support and single-limb support

x = 16000:1:160000;
BW = (BW*9.81);

%%load in all the data from the two force plates. Set NaNs to 0. 
FP1CoPX = HEELDATA(16000:1:160000,9);
FP1CoPX(isnan(FP1CoPX))=0;

FP1CoPY = HEELDATA(16000:1:160000,10);
FP1CoPY(isnan(FP1CoPY))=0;

FP1CoPZ = HEELDATA(16000:1:160000,11); 
FP1CoPZ(isnan(FP1CoPZ))=0;

FP1ForceZ = ((HEELDATA(16000:1:160000,5))/BW)*100;
FP1ForceZ(isnan(FP1ForceZ))=0;
FP1ForceZ = lowpass(FP1ForceZ, 30, 1000);

FP2CoPX = HEELDATA(16000:1:160000,18); 
FP2CoPX(isnan(FP2CoPX))=0;

FP2CoPY = HEELDATA(16000:1:160000,19);
FP2CoPY(isnan(FP2CoPY))=0;

FP2CoPZ = HEELDATA(16000:1:160000,20);
FP2CoPZ(isnan(FP2CoPZ))=0;

FP2ForceZ = ((HEELDATA(16000:1:160000,14))/BW)*100;
FP2ForceZ(isnan(FP2ForceZ))=0;
FP2ForceZ = lowpass(FP2ForceZ, 30, 1000);

%% Lists all the data points where the foot is planted
%  Left FOOT 
[ii, ~] = find(~FP1ForceZ);                  %finds all zero values of FP1ForceZ (when Right foot leaves the ground)

%now we need to find were the rows separate (when the foot leaves the ground) and start a new column whenever
%this happens. 
j = 1;                                      %j is the Column Counter 
k = 1;                                      %k is so every new column of data starts at row 1. 
for i=400:(length(ii)-1)
    i = i+1;
    k = k+1;
    if  (ii(i)) - (ii(i-1)) > 1         %If the data isn't sequential, 
         j=j+1;                          %start a new column
         k = 1;                          %and start at row 1. 
    end
    StepList(k,j) = nonzeros(ii(i));            %should return only non-zero values
end

[numRows,numCols] = size(StepList);         %this counts the number of rows and columns of my newly generated list of steps 

for m = 0:numCols-1                         %There's a lot of noise (false steps) so we need to get rid of those. 
    m = m+1;                                %m is the column counter
    if nnz(StepList(:,m)) > 1000        %if the column is longer than 1000, it's not a step.
       StepList(:,m) = [0];            %Replace it with zeros. 
    end
    if nnz(StepList(:,m)) < 150          %if the column is less than 50, it's not a step. 
       StepList(:,m) = [0];            %replace the column with zeros. 
    end  
end

%% Now we need to find the x/y data for each step and plot it on a graph.
q = 1;
t = 1;
for q = 1:numCols-1
    if StepList(1,q) > 0                                                %if the column contains data,
        for t = 1:numRows-1
            if StepList(t,q) > 0
                LeftStepx(t,q) = FP2CoPX(StepList(t,q),1);                 %This will contain the Left Foot step (x)
                LeftStepy(t,q) = FP2CoPY(StepList(t,q),1);                 %This will contain the Left foot step (y)
                t=t+1;
            end 
        end
        t=1;
    end
    q=q+1;
end

[numRows,numCols] = size(LeftStepx);

%Let's bring all the steps to 0 so we can display
%them nicely. 
for z = 1:numCols
   offset(1,z) = min(LeftStepy(:,z));                                   %this is the lowest point of each step.
   offset(1,z) = 0-offset(1,z);
   LeftStepy(:,z) = LeftStepy(:,z)+offset(1,z);
end

%Now we need to find the length and width of each step and send it out. 
LeftStepx(LeftStepx==0) = NaN;
LeftStepy(LeftStepy==0) = NaN;
LCOPLength = range(LeftStepy);
LCOPWidth = range(LeftStepx);