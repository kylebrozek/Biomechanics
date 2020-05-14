%% Step length and step width for both R-L and L-R steps 
% Kyle Brozek
% 1/28/2020
% 
clear; 
clc; 
close all;
%% Loads in the data

%BASE1 = xlsread('01BASE.xlsx');                  % OF is normal to the participant.
%STATIC1 = xlsread('01STAT.xlsx');                % Static
%OF1 = xlsread('15OF.xlsx');                      % Optic Flow (OF) is oscillating in the transverse plane at a rate of about .25 Hz. 
%OFDFLOW1 = xlsread('CongruentDFlow.xlsx');              % Load in OF data from the DFLOW sheet. 
%Platform1 = xlsread('15PLAT.xlsx');              % Platform is oscillating in the transverse plane at about 0.25 Hz
%Congruent1 = xlsread('15CON.xlsx');              % Platform and OF oscillating together
Incongruent1 = xlsread('01INC.xlsx');            % Platform and OF oscillating inversely 
%BASEEND1 = xlsread('01END.xlsx');                % OF is normal to the participant. 

Incongruent2 = xlsread('02INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent3 = xlsread('03INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent4 = xlsread('04INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent5 = xlsread('05INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent6 = xlsread('06INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent7 = xlsread('07INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent8 = xlsread('08INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent9 = xlsread('09INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent10 = xlsread('10INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent11 = xlsread('11INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent12 = xlsread('12INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent13 = xlsread('13INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent15 = xlsread('15INC.xlsx');            % Platform and OF oscillating inversely 
Incongruent17 = xlsread('17INC.xlsx');            % Platform and OF oscillating inversely 
%% Run the calculations for all condtions. The function outputs a single Table, T, that contains the average of 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
subplot(7,1,1)
hold on
FunctionPowerAnalysisPlat(BASE1)
title('Baseline')
hold off
subplot(7,1,2)
hold on
FunctionPowerAnalysisPlat(STATIC1)
title('Static')
hold off

subplot(4,1,1)
hold on
FunctionPowerAnalysisPlat(OF1)
title('Optic Flow')
hold off
subplot(4,1,2)
hold on
FunctionPowerAnalysisPlat(Platform1)
title('Platform')
hold off
subplot(4,1,3)
hold on
FunctionPowerAnalysisPlat(Congruent1)
title('Congruent')
hold off
%}
figure(1)
title('Incongruent')
subplot(5,1,1)
hold on
FunctionPowerAnalysisPlat(Incongruent1)
hold off
subplot(5,1,2)
hold on
FunctionPowerAnalysisPlat(Incongruent2)
hold off
subplot(5,1,3)
hold on
FunctionPowerAnalysisPlat(Incongruent3)
hold off
subplot(5,1,4)
hold on
FunctionPowerAnalysisPlat(Incongruent4)
hold off
subplot(5,1,5)
hold on
FunctionPowerAnalysisPlat(Incongruent5)
hold off

figure(2)
title('Incongruent')
subplot(5,1,1)
hold on
FunctionPowerAnalysisPlat(Incongruent6)
hold off
subplot(5,1,2)
hold on
FunctionPowerAnalysisPlat(Incongruent7)
hold off
subplot(5,1,3)
hold on
FunctionPowerAnalysisPlat(Incongruent8)
hold off
subplot(5,1,4)
hold on
FunctionPowerAnalysisPlat(Incongruent9)
hold off
subplot(5,1,5)
hold on
FunctionPowerAnalysisPlat(Incongruent10)
hold off

figure(3)
title('Incongruent')
subplot(5,1,1)
hold on
FunctionPowerAnalysisPlat(Incongruent11)
hold off
subplot(5,1,2)
hold on
FunctionPowerAnalysisPlat(Incongruent12)
hold off
subplot(5,1,3)
hold on
FunctionPowerAnalysisPlat(Incongruent13)
hold off
subplot(5,1,4)
hold on
FunctionPowerAnalysisPlat(Incongruent15)
hold off
subplot(5,1,5)
hold on
FunctionPowerAnalysisPlat(Incongruent17)
hold off
%{
subplot(4,1,4)
hold on
FunctionPowerAnalysisPlat(BASEEND1)
title('Baseline End')
hold off
%}
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%subplot(4,1,1)
%FunctionPowerAnalysisOF(OFDFLOW1)
