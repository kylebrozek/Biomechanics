%% Step length and step width for both R-L and L-R steps 
% Kyle Brozek
% 1/28/2020
% 
clear; 
clc; 
close all;
%% Loads in the data
%BASE2 = xlsread('15BASE.xlsx');                  % OF is normal to the participant.
%STATIC2 = xlsread('15STAT.xlsx');                % Static
OF1 = xlsread('01OF.xlsx');                      % Optic Flow (OF) is oscillating in the transverse plane at a rate of about .25 Hz. 
Platform1 = xlsread('01PLAT.xlsx');              % Platform is oscillating in the transverse plane at about 0.25 Hz
Congruent1 = xlsread('01CON.xlsx');              % Platform and OF oscillating together
Incongruent1 = xlsread('01INC.xlsx');            % Platform and OF oscillating inversely 
%BASEEND2 = xlsread('15END.xlsx');                % OF is normal to the participant. 

OF2 = xlsread('17OF.xlsx');                      % Optic Flow (OF) is oscillating in the transverse plane at a rate of about .25 Hz. 
Platform2 = xlsread('17PLAT.xlsx');              % Platform is oscillating in the transverse plane at about 0.25 Hz
Congruent2 = xlsread('17CON.xlsx');              % Platform and OF oscillating together
Incongruent2 = xlsread('17INC.xlsx');            % Platform and OF oscillating inversely 



%[B1, AngleB] = FunctionCOM(BASE1);
%[S1, AngleS] = FunctionCOM(STATIC1);
%[O1, AngleO] = FunctionCOM(OF1);
[P1, AngleP] = FunctionCOM(Platform1);
[C1, AngleC] = FunctionCOM(Congruent1);
[I1, AngleI] = FunctionCOM(Incongruent1);
%[E1, AngleE] = FunctionCOM(BASEEND1);

figure(2)
[HistogramO] = FunctionHistogram(OF2, AngleP);
bar(HistogramO)
axis([0 38 0 110])
title('Optic Flow (ML s.d. -19 to 19 deg.)')
xlabel('Degrees of Rotation')
ylabel('Variability (mm)')

figure(3)
[HistogramP] = FunctionHistogram(Platform2, AngleP);
bar(HistogramP)
axis([0 38 0 110])
title('Platform (ML s.d. -19 to 19 deg.)')
xlabel('Degrees of Rotation') 
ylabel('Variability (mm)') 

figure(4)
[HistogramC] = FunctionHistogram(Congruent2, AngleC);
bar(HistogramC)
axis([0 38 0 110])
title('Congruent (ML s.d. -19 to 19 deg.)')
xlabel('Degrees of Rotation') 
ylabel('Variability (mm)')

figure(5)
[HistogramI] = FunctionHistogram(Incongruent2, AngleI);
bar(HistogramI)
axis([0 38 0 110])
title('Incongruent (ML s.d. -19 to 19 deg.)')
xlabel('Degrees of Rotation') 
ylabel('Variability (mm)')
