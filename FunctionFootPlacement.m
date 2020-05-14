function [LStrikesX, LStrikesY, RStrikesX, RStrikesY] = FunctionFootPlacement(HEELDATA)
%HEELSTRIKE
%   
% Function finds the heelstrikes of the participant by looking at heel marker data.  
% It then finds the geometric center of the right and left ASIS at each heelstrike  
% which becomes the origin of the plot. The x and y distance from the geometric hip-center and
% the left/right heels are then plotted. 
% 
% Loads in the data
LHeelX = (HEELDATA(1600:16000,63)+500); 
LHeelY = (HEELDATA(1600:16000,64)+500); 
LHeelZ = (HEELDATA(1600:16000,65)); 

RHeelX = (HEELDATA(1600:16000,54)+500);
RHeelY = (HEELDATA(1600:16000,55)+500);
RHeelZ = (HEELDATA(1600:16000,56));

SacrumX = (HEELDATA(1600:16000,15)+500);    
SacrumY = (HEELDATA(1600:16000,16)+500);    

%treadmill markers
ALTX = (HEELDATA(1600:16000,105)+500);
ALTY = (HEELDATA(1600:16000,106)+500);
ARTX = (HEELDATA(1600:16000,96)+500);
ARTY = (HEELDATA(1600:16000,97)+500);
PLTX = (HEELDATA(1600:16000,102)+500);
PLTY = (HEELDATA(1600:16000,103)+500);
PRTX = (HEELDATA(1600:16000,99)+500);
PRTY = (HEELDATA(1600:16000,100)+500);

LENGTH = 1:1:length(RHeelZ);
%% Midpoints of the anterior and posterior treadmill markers. 
%  These will be used to plot the midlines at each heelstrike. 
Mid1X = -(ALTX + ARTX) /2;
Mid1Y = -(ALTY + ARTY) /2;
Mid2X = -(PLTX + PRTX) /2;
Mid2Y = -(PLTY + PRTY) /2;

%% HeelStrike Finder
[RPeaks RLocs] = findpeaks(-RHeelZ,'MinPeakProminence',35);    %gives the values and locations of the peaks greater than 0
[LPeaks LLocs] = findpeaks(-LHeelZ,'MinPeakProminence',35);    %gives the values and locations of the peaks greater than 0

for i = 0:(length(LLocs)-10)
    i = i+1;

Rplotx(i,1) = RLocs(i,1);                    % this is now the row# of the right heelstrike 
Lplotx(i,1) = LLocs(i,1);                    % this is now the row# of the left heelstrike 

HR(i,1) = -RHeelX((RLocs(i,1)),1);           % Right Heelstrike x position 
HR(i,2) = -RHeelY((RLocs(i,1)),1);           % Right Heelstrike y position
HL(i,1) = -LHeelX((LLocs(i,1)),1);           % Left Heelstrike x position 
HL(i,2) = -LHeelY((LLocs(i,1)),1);           % Left Heelstrike y position

SR(i,1) = -SacrumX((RLocs(i,1)),1);          % Sacrum X at right heelstrike
SR(i,2) = -SacrumY((RLocs(i,1)),1);          % Sacrum Y at right heelstrike
SL(i,1) = -SacrumX((LLocs(i,1)),1);          % Sacrum X at left heelstrike
SL(i,2) = -SacrumY((LLocs(i,1)),1);          % Sacrum Y at left heelstrike

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
Sx = [SL(i,1) SR(i,1)];
Sy = [SL(i,2) SR(i,2)];

%defines the center of rotation
x_center = 504;
y_center = 600;

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
Srot(:,k) = M*[Sx(k) Sy(k) 1]';
end


% pick out the vectors of rotated x- and y-data
x_rot = Linerot(1,:);
y_rot = Linerot(2,:);
hx_rot = Hrot(1,:);
hy_rot = Hrot(2,:);
sx_rot = Srot(1,:);
sy_rot = Srot(2,:);

%% Normalizing the sacrum 
%this will find the x/y displacement of the sacrum from the center point
%it then adds that displacement to ALL points

 LXdisp = x_center - sx_rot(1,1);  % finds the x displacement of the sacrum from the center
 LYdisp = y_center - sy_rot(1,1);  % finds the y displacement of the sacrum from the center (center - sac)
 RXdisp = x_center - sx_rot(1,2);  % finds the x displacement of the sacrum from the center
 RYdisp = y_center - sy_rot(1,2);  % finds the y displacement of the sacrum from the center (center - sac)
 
 sx_rot(1,1) = sx_rot(1,1) + LXdisp; % add x displacement to sx_rot(1,1) aka LHSacX
 sy_rot(1,1) = sy_rot(1,1) + LYdisp; % add y displacement to sy_rot(1,1) aka LHSacY
 sx_rot(1,2) = sx_rot(1,2) + RXdisp; % add x displacement to sx_rot(1,2) aka RHSacX
 sy_rot(1,2) = sy_rot(1,2) + RYdisp; % add y displacement to sy_rot(1,2) aka RHSacY
 hx_rot(1,1) = hx_rot(1,1) + LXdisp; % add x displacement to hx_rot(1,1) aka LHX
 hy_rot(1,1) = hy_rot(1,1) + LYdisp; % add y displacement to hy_rot(1,1) aka LHY
 hx_rot(1,2) = hx_rot(1,2) + RXdisp; % add x displacement to hx_rot(1,2) aka RHX
 hy_rot(1,2) = hy_rot(1,2) + RYdisp; % add y displacement to hy_rot(1,2) aka RHY
 
%% plots
hold on
%plot(x,y)

%{
%these are the original points without rotation
plot(HL(i,1),HL(i,2),'ko','MarkerFaceColor','r')
plot(HR(i,1),HR(i,2),'ko','MarkerFaceColor','b')
plot(SR(i,1),SR(i,2),'ko')
plot(SL(i,1),SL(i,2),'ko')
axis([-400 400 -1000 1000])
%}

%these are the rotated points 
plot(x_rot, y_rot, 'r-', x_center, y_center, 'go'); %plots the rotated lines
plot(hx_rot(1,1), hy_rot(1,1), 'b*')  %plots the rotated left heel strikes
plot(hx_rot(1,2), hy_rot(1,2), 'r*')  %plots the rotated right heel strikes
%plot(sx_rot(1,1), sy_rot(1,1), 'k*')  %plots the rotated left-heel sacrum points
%plot(sx_rot(1,2), sy_rot(1,2), 'k*')  %plots the rotated right-heel sacrum points

LStrikesX(i) = hx_rot(1,1);     %list of x positions of the left heelstrikes
LStrikesY(i) = hy_rot(1,1);     %list of y positions of the left heelstrikes
RStrikesX(i) = hx_rot(1,2);     %list of x positions of the right heelstrikes
RStrikesY(i) = hy_rot(1,2);     %list of y positions of the right heelstrikes
end
axis([350 700 601 850])

