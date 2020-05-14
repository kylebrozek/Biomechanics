function FunctionPowerAnalysisOF(HEELDATA)
%HEELSTRIKE
% 
% Function finds the heelstrikes of the participant by looking at heel marker data.  
% After compiling a list of all left and right heelstrikes, this code then
% finds the ML and AP distances of Left-to-Right steps and Right-to-Left
% steps. 
% 
% Loads in the hip data data

%%OF only:
%loads in the OF signal from DFlow
OFSigx = (HEELDATA(1:1:120000,3));

LENGTH = 1:1:length(OFSigx);

y = OFSigx(5:1:120000,1);
Y = fft(abs(y));
Fs = 300;                       % Sampling frequency                    
T = 1/Fs;                       % Sampling period       
L = length(OFSigx(:,1));          % Length of signal
t = (0:L-1)*T;                  % Time vector
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

f' == highpass(f', 2, 1000);
P1 == highpass(P1, 2, 1000);

plot(f',P1, 'r') 
axis([0 .3 0 10])
title('Single-Sided Amplitude Spectrum of Perturbation Signal')
xlabel('f (Hz)')
ylabel('|P1(f)|')


