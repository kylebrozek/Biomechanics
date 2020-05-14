function [T, Angle] = FunctionCOM(HEELDATA)
%HEELSTRIKE
% 
% Function finds the heelstrikes of the participant by looking at heel marker data.  
% After compiling a list of all left and right heelstrikes, this code then
% finds the ML and AP distances of Left-to-Right steps and Right-to-Left
% steps. 
% 
% Loads in the hip data data
RASISX = (HEELDATA(1:1:16100,3));           % Loads frames 1:xxx of the data (x-position of Right ASIS marker)
RASISY = (HEELDATA(1:1:16100,4)); 
RASISZ = (HEELDATA(1:1:16100,5)); 

LASISX = (HEELDATA(1:1:16100,6)); 
LASISY = (HEELDATA(1:1:16100,7)); 
LASISZ = (HEELDATA(1:1:16100,8));

% Loads in the Trunk data data
T10X = (HEELDATA(1:1:16100,72));            % Loads frames 1:xxx of the data (x-position of T10 marker)
T10Y = (HEELDATA(1:1:16100,73)); 
T10Z = (HEELDATA(1:1:16100,74)); 

C7X = (HEELDATA(1:1:16100,75)); 
C7Y = (HEELDATA(1:1:16100,76)); 
C7Z = (HEELDATA(1:1:16100,77));

JNX = (HEELDATA(1:1:16100,78));             % Loads frames 1:xxx of the data (x-position of Right JN marker)
JNY = (HEELDATA(1:1:16100,79)); 
JNZ = (HEELDATA(1:1:16100,80)); 

XIPHX = (HEELDATA(1:1:16100,81)); 
XIPHY = (HEELDATA(1:1:16100,82)); 
XIPHZ = (HEELDATA(1:1:16100,83));

% Loads in the Head data data
ALHEADX = (HEELDATA(1:1:16100,3));          % Loads frames 1:xxx of the data (x-position of ALHEAD marker)
ALHEADY = (HEELDATA(1:1:16100,4)); 
ALHEADZ = (HEELDATA(1:1:16100,5)); 

ARHEADX = (HEELDATA(1:1:16100,6)); 
ARHEADY = (HEELDATA(1:1:16100,7)); 
ARHEADZ = (HEELDATA(1:1:16100,8));

PRHEADX = (HEELDATA(1:1:16100,3));          % Loads frames 1:xxx of the data (x-position of PRHEAD marker)
PRHEADY = (HEELDATA(1:1:16100,4)); 
PRHEADZ = (HEELDATA(1:1:16100,5)); 

PLHEADX = (HEELDATA(1:1:16100,6)); 
PLHEADY = (HEELDATA(1:1:16100,7)); 
PLHEADZ = (HEELDATA(1:1:16100,8));

%treadmill markers
ALTX = (HEELDATA(1:1:16100,105));
ALTY = (HEELDATA(1:1:16100,106));

ARTX = (HEELDATA(1:1:16100,96));
ARTY = (HEELDATA(1:1:16100,97));

PLTX = (HEELDATA(1:1:16100,102));
PLTY = (HEELDATA(1:1:16100,103));

PRTX = (HEELDATA(1:1:16100,99));
PRTY = (HEELDATA(1:1:16100,100));

LENGTH = 1:1:16100;
%% Midpoints of the anterior and posterior treadmill markers. 
%  These will be used to plot the midlines at each heelstrike. 
Mid1X = -(ALTX + ARTX) /2;
Mid1Y = -(ALTY + ARTY) /2;
Mid2X = -(PLTX + PRTX) /2;
Mid2Y = -(PLTY + PRTY) /2;

%% Midpoints of the Head markers. 
%  These will be used to plot the midlines at each heelstrike. 
Head1X = -(ALHEADX + ARHEADX) /2;
Head1Y = -(ALHEADY + ARHEADY) /2;
Head2X = -(PLHEADX + PRHEADX) /2;
Head2Y = -(PLHEADY + PRHEADY) /2;

for i = 0:(length(LASISZ)-1)
    i = i+1;
HR(i,1) = RASISX(i,1);           % Right ASIS x position 
HR(i,2) = RASISY(i,1);           % Right ASIS y position
HL(i,1) = LASISX(i,1);           % Left ASIS x position 
HL(i,2) = LASISY(i,1);           % Left ASIS y position

TRUNKA(i,1) = JNX(i,1);            %
TRUNKA(i,2) = JNY(i,1);            %
TRUNKP(i,1) = C7X(i,1);            %
TRUNKP(i,2) = C7Y(i,1);            %

HEADR(i,1) = Head1X(i,1);
HEADR(i,2) = Head1Y(i,1);
HEADL(i,1) = Head2X(i,1);
HEADL(i,2) = Head2Y(i,1);

Mid1(i,1) = Mid1X(i,1);            %X midpoint of the top tread
Mid1(i,2) = Mid1Y(i,1);            %Y midpoint of the top tread
Mid2(i,1) = Mid2X(i,1);            %X midpoint of the bottom tread
Mid2(i,2) = Mid2Y(i,1);            %Y midpoint of the bottom tread

%% Rotation
%x and y are used to define the lines that will be rotated. 
x = [Mid1(i,1) Mid2(i,1)];          %TREAD
y = [Mid1(i,2) Mid2(i,2)];          %TREAD
Hx = [HL(i,1) HR(i,1)];             %HIP
Hy = [HL(i,2) HR(i,2)];             %HIP
Dx = [HEADR(i,1) HEADL(i,1)];       %HEAD                    
Dy = [HEADR(i,2) HEADL(i,2)];       %HEAD
Tx = [TRUNKA(i,1) TRUNKP(i,1)];     %TRUNK
Ty = [TRUNKA(i,2) TRUNKP(i,2)];     %TRUNK

%defines the center of rotation - it's off because of bad marker placement
x_center = 4;
y_center = 100;

%Theta = 90degrees - the angle of the line (i.e. how far the line deviates
%from the vertical axis). 
theta = (0.5 * pi) - atan((Mid1(i,2) - Mid2(i,2)) / (Mid1(i,1) - Mid2(i,1)));
Angle(i,1) = theta;
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
Linerot(:,k) = M*[x(k) y(k) 1]';            %Tread rotate points for the entire timeseries
Hrot(:,k) = M*[Hx(k) Hy(k) 1]';             %Hip rotated points for the entire timeseries 
Drot(:,k) = M*[Dx(k) Dy(k) 1]';             %Head rotated points for the entire timeseries 
Trot(:,k) = M*[Tx(k) Ty(k) 1]';             %Trunk rotated points for the entire timeseries 
end

% pick out the vectors of rotated x- and y-data
x_rot = Linerot(1,:);
y_rot = Linerot(2,:);
hx_rot = Hrot(1,:);
hy_rot = Hrot(2,:);
dx_rot = Drot(1,:);
dy_rot = Drot(2,:);
tx_rot = Trot(1,:);
ty_rot = Trot(2,:);

LASIS(i,1) = hx_rot(1,1);     %list of x positions of the left asis
LASIS(i,2) = hy_rot(1,1);     %list of y positions of the left asis
RASIS(i,1) = hx_rot(1,2);     %list of x positions of the right asis
RASIS(i,2) = hy_rot(1,2);     %list of y positions of the right asis

LHEAD(i,1) = dx_rot(1,1);     %list of x positions of the left head
LHEAD(i,2) = dy_rot(1,1);     %list of y positions of the left head
RHEAD(i,1) = dx_rot(1,2);     %list of x positions of the right head
RHEAD(i,2) = dy_rot(1,2);     %list of y positions of the right head

LTRUNK(i,1) = tx_rot(1,1);     %list of x positions of the left trunk
LTRUNK(i,2) = ty_rot(1,1);     %list of y positions of the left trunk
RTRUNK(i,1) = tx_rot(1,2);     %list of x positions of the right trunk
RTRUNK(i,2) = ty_rot(1,2);     %list of y positions of the right trunk

COMH(i,1) = (((LASIS(i,1))+(RASIS(i,1))/2)); %X position of the COM of the hip
COMH(i,2) = (((LASIS(i,2))+(RASIS(i,2))/2)); %Y position of the COM of the hip

COMD(i,1) = (((LHEAD(i,1))+(RHEAD(i,1))/2)); %X position of the centroid of the head
COMD(i,2) = (((LHEAD(i,2))+(RHEAD(i,2))/2)); %Y position of the centroid of the head

COMT(i,1) = (((LTRUNK(i,1))+(RTRUNK(i,1))/2)); %X position of the centroid of the trunk
COMT(i,2) = (((LTRUNK(i,2))+(RTRUNK(i,2))/2)); %Y position of the centroid of the trunk
end

%The following 3 lines make all the data start at 0 (or 900 if you want to
%process means/sd correctly).
Hoffset(:,1) = COMD(:,1) - (COMD(5,1));
Toffset(:,1) = COMT(:,1) - (COMT(5,1));
Poffset(:,1) = COMH(:,1) - (COMH(5,1));         

Pyoffset(:,1) = COMH(:,2) - (COMH(5,2));        %this is the pelvis AP deviation timeseries and it starts at 0. 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on
%plot( LENGTH, Pyoffset(:,1), 'r');          %plots the AP COM for the trial
%plot(Poffset(:,1),  LENGTH,  'r');
MLAvg = mean(Poffset(5:end,1));            
MLSD = std(Poffset(5:end,1));
MLCoefV = MLSD/MLAvg;

APAvg = mean(Pyoffset(5:end,1));
APSD = std(Pyoffset(5:end,1));
APCoefV = APSD/APAvg;
axis([-500 500 1 16100 ])
title('CoM Position')
xlabel('Deviation (mm)') 
ylabel('Time (s)') 
hold off

T = table(MLAvg,MLSD,MLCoefV,APAvg,APSD,APCoefV);
Angle = rad2deg(Angle);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
plot(Hoffset(:,1), LENGTH, 'b');          %plots the ML COM for the trial

MLAvg = mean(COMD(:,1));
MLSD = std(COMD(:,1));
MLCoefV = MLSD/MLAvg;

APAvg = mean(COMD(:,2));
APSD = std(COMD(:,2));
APCoefV = APSD/APAvg;

axis([400 1200 -inf inf])
title('Head')
xlabel('ML Deviation (mm)') 
ylabel('Time (ms)') 
%text(-500,-1000,sprintf('Average ML Offset = %f ',MLAvg))
%text(-500,-1400,sprintf('Std. Dev. = %f ',MLSD))
%text(-500,-1800,sprintf('Coef. Var. = %f ',MLCoefV))
sprintf('Average ML Offset = %f ',MLAvg)
sprintf('Std. Dev. = %f ',MLSD)
sprintf('Coef. Var. = %f ',MLCoefV)
sprintf('Average AP Offset = %f ',APAvg)
sprintf('Std. Dev. = %f ',APSD)
sprintf('Coef. Var. = %f ',APCoefV)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
hold on
plot(Toffset(:,1), LENGTH, 'g');          %plots the ML COM for the trial

MLAvg = mean(COMT(:,1));
MLSD = std(COMT(:,1));
MLCoefV = MLSD/MLAvg;

APAvg = mean(COMT(:,2));
APSD = std(COMT(:,2));
APCoefV = APSD/APAvg;

axis([400 1200 -inf inf])
title('Trunk')
xlabel('ML Deviation (mm)') 
ylabel('Time (ms)') 
%text(-500,-1000,sprintf('Average ML Offset = %f ',MLAvg))
%text(-500,-1400,sprintf('Std. Dev. = %f ',MLSD))
%text(-500,-1800,sprintf('Coef. Var. = %f ',MLCoefV))
sprintf('Average ML Offset = %f ',MLAvg)
sprintf('Std. Dev. = %f ',MLSD)
sprintf('Coef. Var. = %f ',MLCoefV)
sprintf('Average AP Offset = %f ',APAvg)
sprintf('Std. Dev. = %f ',APSD)
sprintf('Coef. Var. = %f ',APCoefV)
hold off
%}
