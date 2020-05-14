function [T] = FunctionStepLengthWidth(HEELDATA)
%HEELSTRIKE
%   
% Function finds the heelstrikes of the participant by looking at heel marker data.  
% After compiling a list of all left and right heelstrikes, this code then
% finds the ML and AP distances of Left-to-Right steps and Right-to-Left
% steps. 
% 
% Loads in the left and right heel marker data
LHeelX = (HEELDATA(1600:16000,63)); 
LHeelY = (HEELDATA(1600:16000,64)); 
LHeelZ = (HEELDATA(1600:16000,65)); 

RHeelX = (HEELDATA(1600:16000,54));
RHeelY = (HEELDATA(1600:16000,55));
RHeelZ = (HEELDATA(1600:16000,56));

%loads in the treadmill marker data
ALTX = (HEELDATA(1600:16000,105));
ALTY = (HEELDATA(1600:16000,106));
ARTX = (HEELDATA(1600:16000,96));
ARTY = (HEELDATA(1600:16000,97));
PLTX = (HEELDATA(1600:16000,102));
PLTY = (HEELDATA(1600:16000,103));
PRTX = (HEELDATA(1600:16000,99));
PRTY = (HEELDATA(1600:16000,100));

LENGTH = 1:1:length(RHeelZ);
%% Midpoints of the anterior and posterior treadmill markers. 
%  These will be used to plot the midlines at each heelstrike so I know if
%  my rotation matrix is working correctly. 
Mid1X = (ALTX + ARTX) /2;
Mid1Y = (ALTY + ARTY) /2;
Mid2X = (PLTX + PRTX) /2;
Mid2Y = (PLTY + PRTY) /2;

%% HeelStrike Finder
[RPeaks RLocs] = findpeaks(RHeelZ,'MinPeakProminence',35);    %gives the values and locations of the peaks greater than 0
[LPeaks LLocs] = findpeaks(LHeelZ,'MinPeakProminence',35);    %gives the values and locations of the peaks greater than 0

for i = 0:(length(LLocs)-10)
    i = i+1;

Rplotx(i,1) = RLocs(i,1);                    % this is now the row# of the right heelstrike 
Lplotx(i,1) = LLocs(i,1);                    % this is now the row# of the left heelstrike 

HR(i,1) = RHeelX((RLocs(i,1)),1);           % Right Heelstrike x position 
HR(i,2) = RHeelY((RLocs(i,1)),1);           % Right Heelstrike y position
HL(i,1) = LHeelX((LLocs(i,1)),1);           % Left Heelstrike x position 
HL(i,2) = LHeelY((LLocs(i,1)),1);           % Left Heelstrike y position

TR(i,1) = RHeelX((LLocs(i,1)),1);           % Trailing Right Heel x position druing left heelstrike
TR(i,2) = RHeelY((LLocs(i,1)),1);           % Trailing Right Heel y position druing left heelstrike
TL(i,1) = LHeelX((RLocs(i,1)),1);           % Trailing Left Heel x position druing right heelstrike
TL(i,2) = LHeelY((RLocs(i,1)),1);           % Trailing Left Heel y position druing right heelstrike

Mid1(i,1) = Mid1X((RLocs(i,1)),1);            %X midpoint of the top tread
Mid1(i,2) = Mid1Y((RLocs(i,1)),1);            %Y midpoint of the top tread
Mid2(i,1) = Mid2X((RLocs(i,1)),1);            %X midpoint of the bottom tread
Mid2(i,2) = Mid2Y((RLocs(i,1)),1);            %Y midpoint of the bottom tread

%% Rotation
%x and y are used to define the lines that will be rotated. 
x = [Mid1(i,1) Mid2(i,1)];
y = [Mid1(i,2) Mid2(i,2)];
Hx = [HL(i,1) HR(i,1)];
Hy = [HL(i,2) HR(i,2)];
Tx = [TL(i,1) TR(i,1)];
Ty = [TL(i,2) TR(i,2)];

%defines the center of rotation - center of rotation is at (4,100) due to 
%poor marker placement, poor calibration wand placement, camera offset, etc. 
x_center = 4;
y_center = 100;

%Theta = 90degrees - the angle of the line (i.e. how far the line deviates
%from the vertical axis). 
theta = (0.5 * pi) - atan((Mid1(i,2) - Mid2(i,2)) / (Mid1(i,1) - Mid2(i,1)));
if theta > 1
    theta = theta - pi;
end

%R is the rotation matrix... 
R = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];

%Define affine transformation for translation
a = [1 0 x_center;0 1 y_center; 0 0 1];
c = [1 0 -x_center;0 1 -y_center; 0 0 1];
M = a*R*c;
for k=1:2
Linerot(:,k) = M*[x(k) y(k) 1]';
Hrot(:,k) = M*[Hx(k) Hy(k) 1]';
Trot(:,k) = M*[Tx(k) Ty(k) 1]';
end


% pick out the vectors of rotated x- and y-data
x_rot = Linerot(1,:);
y_rot = Linerot(2,:);
hx_rot = Hrot(1,:);
hy_rot = Hrot(2,:);
tx_rot = Trot(1,:);
ty_rot = Trot(2,:);

LStrikesX(i) = hx_rot(1,1);     %list of x positions of the left heelstrikes
LStrikesY(i) = hy_rot(1,1);     %list of y positions of the left heelstrikes
RStrikesX(i) = hx_rot(1,2);     %list of x positions of the right heelstrikes
RStrikesY(i) = hy_rot(1,2);     %list of y positions of the right heelstrikes

LTrailX(i) = tx_rot(1,1);       %list of x positions of the trailing heel (L) during right heelstrikes
LTrailY(i) = ty_rot(1,1);       %list of y positions of the trailing heel (L) during right heelstrikes
RTrailX(i) = tx_rot(1,2);       %list of x positions of the trailing heel (R) during left heelstrikes
RTrailY(i) = ty_rot(1,2);       %list of y positions of the trailing heel (R) during left heelstrikes

end
   
for i = 0:(length(LStrikesX)-1)
    i = i+1;
    
    %%R SL
    RSL(i) = abs(LTrailY(i) - RStrikesY(i));
    
    %%R SW
    RSW(i) = abs(LTrailX(i) - RStrikesX(i));
    
    %%L SL
    LSL(i) = abs(RTrailY(i) - LStrikesY(i));
    
    %%L SW
    LSW(i) = abs(RTrailX(i) - LStrikesX(i));
    
end

AvgRightStepLength = mean(RSL);
AvgRightStepWidth = mean(RSW);
AvgLeftStepLength = mean(LSL);
AvgLeftStepWidth  = mean(LSW);

T = table(AvgRightStepLength,AvgRightStepWidth,AvgLeftStepLength,AvgLeftStepWidth);