%% Step length and step width for both R-L and L-R steps 
% Kyle Brozek
% 1/28/2020
% 
clear; 
clc; 
close all;

%% Loads in the data
BASE1 = xlsread('17BASE.xlsx');                 % OF is normal to the participant.
STATIC = xlsread('17STAT.xlsx');                % Static
OF = xlsread('17OF.xlsx');                      % Optic Flow (OF) is oscillating in the transverse plane at a rate of about .25 Hz. 
Platform = xlsread('17PLAT.xlsx');              % Platform is oscillating in the transverse plane at about 0.25 Hz
Congruent = xlsread('17CON.xlsx');              % Platform and OF oscillating together
Incongruent = xlsread('17INC.xlsx');            % Platform and OF oscillating inversely 
BASE2 = xlsread('17END.xlsx');                  % OF is normal to the participant. 

%% Run the calculations for all condtions. The function outputs a single Table, T, that contains the average of 
%  

[B] = FunctionStepLengthWidth(BASE1)

[S] = FunctionStepLengthWidth(STATIC)

[O] = FunctionStepLengthWidth(OF)   

[P] = FunctionStepLengthWidth(Platform)  

[C] = FunctionStepLengthWidth(Congruent)   

[I] = FunctionStepLengthWidth(Incongruent)  

[E] = FunctionStepLengthWidth(BASE2)

