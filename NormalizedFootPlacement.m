%% Heelstrikes with sacrum location at each heelstrike 
% Kyle Brozek
% 9/4/2019
% 
clear; 
clc; 
close all; 
%% Loads in the data
BASE1 = xlsread('11BASE.xlsx');                 % OF is normal to the participant.
STATIC = xlsread('11STAT.xlsx');                % Static
OF = xlsread('11OF.xlsx');                      % Optic Flow (OF) is oscillating in the transverse plane at a rate of about .25 Hz. 
Platform = xlsread('11PLAT.xlsx');              % Platform is oscillating in the transverse plane at about 0.25 Hz
Congruent = xlsread('11CON.xlsx');              % Platform and OF oscillating together
Incongruent = xlsread('11INC.xlsx');            % Platform and OF oscillating inversely 
BASE2 = xlsread('11END.xlsx');                  % OF is normal to the participant. 

%% Plot all of the points 
figure(1)                                                                                                                                   
subplot(2,2,1)
hold on
[LX, LY, RX, RY] = FunctionFootPlacement(-BASE1);            
title('Baseline')
xlabel('ML Deviation (mm)') 
ylabel('AP Deviation (mm)') 
hold off

Lminy = mink(LY,6);
Lminx = mink(LX,6);
Lmaxy = maxk(LY,6);
Lmaxx = maxk(LX,6);
Rminy = mink(RY,6);
Rminx = mink(RX,6);
Rmaxy = maxk(RY,6);
Rmaxx = maxk(RX,6);
Data(1,1) = Lmaxx(1,6) - Lminx(1,6);  %Left Width
Data(1,2) = Rmaxx(1,6) - Rminx(1,6);  %Right Width
Data(1,3) = Lmaxy(1,6) - Lminy(1,6); %Left Length
Data(1,4) = Rmaxy(1,6) - Rminy(1,6); %Right Length

%{
subplot(2,2,2)
hold on
[LX, LY, RX, RY] = FunctionFootPlacement(-STATIC);            
title('Static')
xlabel('ML Deviation (mm)') 
ylabel('AP Deviation (mm)') 
hold off

Lminy = mink(LY,6);
Lminx = mink(LX,6);
Lmaxy = maxk(LY,6);
Lmaxx = maxk(LX,6);
Rminy = mink(RY,6);
Rminx = mink(RX,6);
Rmaxy = maxk(RY,6);
Rmaxx = maxk(RX,6);
Data(2,1) = Lmaxx(1,6) - Lminx(1,6);  %Left Width
Data(2,2) = Rmaxx(1,6) - Rminx(1,6);  %Right Width
Data(2,3) = Lmaxy(1,6) - Lminy(1,6); %Left Length
Data(2,4) = Rmaxy(1,6) - Rminy(1,6); %Right Length


subplot(2,2,3) 
hold on
[LX, LY, RX, RY] = FunctionFootPlacement(-OF);  
title('OF')
xlabel('ML Deviation (mm)') 
ylabel('AP Deviation (mm)') 
hold off

Lminy = mink(LY,6);
Lminx = mink(LX,6);
Lmaxy = maxk(LY,6);
Lmaxx = maxk(LX,6);
Rminy = mink(RY,6);
Rminx = mink(RX,6);
Rmaxy = maxk(RY,6);
Rmaxx = maxk(RX,6);
Data(3,1) = Lmaxx(1,6) - Lminx(1,6);  %Left Width
Data(3,2) = Rmaxx(1,6) - Rminx(1,6);  %Right Width
Data(3,3) = Lmaxy(1,6) - Lminy(1,6); %Left Length
Data(3,4) = Rmaxy(1,6) - Rminy(1,6); %Right Length
%}

subplot(2,2,2)
hold on
[LX, LY, RX, RY] = FunctionFootPlacement(-Platform);  
title('Platform')
xlabel('ML Deviation (mm)') 
ylabel('AP Deviation (mm)') 
hold off

Lminy = mink(LY,6);
Lminx = mink(LX,6);
Lmaxy = maxk(LY,6);
Lmaxx = maxk(LX,6);
Rminy = mink(RY,6);
Rminx = mink(RX,6);
Rmaxy = maxk(RY,6);
Rmaxx = maxk(RX,6);
Data(4,1) = Lmaxx(1,6) - Lminx(1,6);  %Left Width
Data(4,2) = Rmaxx(1,6) - Rminx(1,6);  %Right Width
Data(4,3) = Lmaxy(1,6) - Lminy(1,6); %Left Length
Data(4,4) = Rmaxy(1,6) - Rminy(1,6); %Right Length

subplot(2,2,3)
hold on
[LX, LY, RX, RY] = FunctionFootPlacement(-Congruent); 
title('Congruent')
xlabel('ML Deviation (mm)') 
ylabel('AP Deviation (mm)') 
hold off

Lminy = mink(LY,6);
Lminx = mink(LX,6);
Lmaxy = maxk(LY,6);
Lmaxx = maxk(LX,6);
Rminy = mink(RY,6);
Rminx = mink(RX,6);
Rmaxy = maxk(RY,6);
Rmaxx = maxk(RX,6);
Data(5,1) = Lmaxx(1,6) - Lminx(1,6);  %Left Width
Data(5,2) = Rmaxx(1,6) - Rminx(1,6);  %Right Width
Data(5,3) = Lmaxy(1,6) - Lminy(1,6); %Left Length
Data(5,4) = Rmaxy(1,6) - Rminy(1,6); %Right Length

subplot(2,2,4)
hold on
[LX, LY, RX, RY] = FunctionFootPlacement(-Incongruent); 
title('Incongruent')
xlabel('ML Deviation (mm)') 
ylabel('AP Deviation (mm)') 
hold off

Lminy = mink(LY,6);
Lminx = mink(LX,6);
Lmaxy = maxk(LY,6);
Lmaxx = maxk(LX,6);
Rminy = mink(RY,6);
Rminx = mink(RX,6);
Rmaxy = maxk(RY,6);
Rmaxx = maxk(RX,6);
Data(6,1) = Lmaxx(1,6) - Lminx(1,6);  %Left Width
Data(6,2) = Rmaxx(1,6) - Rminx(1,6);  %Right Width
Data(6,3) = Lmaxy(1,6) - Lminy(1,6); %Left Length
Data(6,4) = Rmaxy(1,6) - Rminy(1,6); %Right Length

%{
subplot(2,3,5)
hold on
[LX, LY, RX, RY] = FunctionFootPlacement(-BASE2); 
title('BaselineEnd')
xlabel('ML Deviation (mm)') 
ylabel('AP Deviation (mm)') 
hold off

Lminy = mink(LY,6);
Lminx = mink(LX,6);
Lmaxy = maxk(LY,6);
Lmaxx = maxk(LX,6);
Rminy = mink(RY,6);
Rminx = mink(RX,6);
Rmaxy = maxk(RY,6);
Rmaxx = maxk(RX,6);
Data(7,1) = Lmaxx(1,6) - Lminx(1,6);  %Left Width
Data(7,2) = Rmaxx(1,6) - Rminx(1,6);  %Right Width
Data(7,3) = Lmaxy(1,6) - Lminy(1,6); %Left Length
Data(7,4) = Rmaxy(1,6) - Rminy(1,6); %Right Length
%}