function FunctionPowerAnalysisPlat(HEELDATA)
%HEELSTRIKE
% 
% Function finds the heelstrikes of the participant by looking at heel marker data.  
% After compiling a list of all left and right heelstrikes, this code then
% finds the ML and AP distances of Left-to-Right steps and Right-to-Left
% steps. 
% 
% Loads in the hip data data
RASISX = (-HEELDATA(1:1:16000,3))-550;           % Loads frames 10000 to 20000 of column 3 of the data (x-position of Right ASIS marker)
RASISY = (-HEELDATA(1:1:16000,4))-850; 
RASISZ = (-HEELDATA(1:1:16000,5)); 

LASISX = (-HEELDATA(1:1:16000,6))-550; 
LASISY = (-HEELDATA(1:1:16000,7))-850; 
LASISZ = (-HEELDATA(1:1:16000,8));

% Loads in the Trunk data data
T10X = (-HEELDATA(1:1:16000,72))-550;            % Loads frames 10000 to 20000 of column 3 of the data (x-position of Right ASIS marker)
T10Y = (-HEELDATA(1:1:16000,73))-850; 
T10Z = (-HEELDATA(1:1:16000,74)); 

C7X = (-HEELDATA(1:1:16000,75))-550; 
C7Y = (-HEELDATA(1:1:16000,76))-850; 
C7Z = (-HEELDATA(1:1:16000,77));

JNX = (-HEELDATA(1:1:16000,78))-550;             % Loads frames 10000 to 20000 of column 3 of the data (x-position of Right ASIS marker)
JNY = (-HEELDATA(1:1:16000,79))-850; 
JNZ = (-HEELDATA(1:1:16000,80)); 

XIPHX = (-HEELDATA(1:1:16000,81))-550; 
XIPHY = (-HEELDATA(1:1:16000,82))-850; 
XIPHZ = (-HEELDATA(1:1:16000,83));

% Loads in the Head data data
ALHEADX = (-HEELDATA(1:1:16000,3))-550;          % Loads frames 10000 to 20000 of column 3 of the data (x-position of Right ASIS marker)
ALHEADY = (-HEELDATA(1:1:16000,4))-850; 
ALHEADZ = (-HEELDATA(1:1:16000,5)); 

ARHEADX = (-HEELDATA(1:1:16000,6))-550; 
ARHEADY = (-HEELDATA(1:1:16000,7))-850; 
ARHEADZ = (-HEELDATA(1:1:16000,8));

PRHEADX = (-HEELDATA(1:1:16000,3))-550;          % Loads frames 10000 to 20000 of column 3 of the data (x-position of Right ASIS marker)
PRHEADY = (-HEELDATA(1:1:16000,4))-850; 
PRHEADZ = (-HEELDATA(1:1:16000,5)); 

PLHEADX = (-HEELDATA(1:1:16000,6))-550; 
PLHEADY = (-HEELDATA(1:1:16000,7))-850; 
PLHEADZ = (-HEELDATA(1:1:16000,8));

%treadmill markers
ALTX = (-HEELDATA(1:1:16000,105))-550;
ALTY = (-HEELDATA(1:1:16000,106))-850;

ARTX = (-HEELDATA(1:1:16000,96))-550;
ARTY = (-HEELDATA(1:1:16000,97))-850;

PLTX = (-HEELDATA(1:1:16000,102))-550;
PLTY = (-HEELDATA(1:1:16000,103))-850;

PRTX = (-HEELDATA(1:1:16000,99))-550;
PRTY = (-HEELDATA(1:1:16000,100))-850;

LENGTH = 1:1:length(LASISZ);
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
HR(i,1) = -RASISX(i,1);           % Right ASIS x position 
HR(i,2) = -RASISY(i,1);           % Right ASIS y position
HL(i,1) = -LASISX(i,1);           % Left ASIS x position 
HL(i,2) = -LASISY(i,1);           % Left ASIS y position

TRUNKA(i,1) = -JNX(i,1);            %
TRUNKA(i,2) = -JNY(i,1);            %
TRUNKP(i,1) = -C7X(i,1);            %
TRUNKP(i,2) = -C7Y(i,1);            %

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
x_center = 275;
y_center = 425;

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
Drot(:,k) = M*[Dx(k) Dy(k) 1]';
Trot(:,k) = M*[Tx(k) Ty(k) 1]';
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

LHEAD(i,1) = dx_rot(1,1);     %list of x positions of the left asis
LHEAD(i,2) = dy_rot(1,1);     %list of y positions of the left asis
RHEAD(i,1) = dx_rot(1,2);     %list of x positions of the right asis
RHEAD(i,2) = dy_rot(1,2);     %list of y positions of the right asis

LTRUNK(i,1) = tx_rot(1,1);     %list of x positions of the left asis
LTRUNK(i,2) = ty_rot(1,1);     %list of y positions of the left asis
RTRUNK(i,1) = tx_rot(1,2);     %list of x positions of the right asis
RTRUNK(i,2) = ty_rot(1,2);     %list of y positions of the right asis

COMH(i,1) = (((LASIS(i,1))+(RASIS(i,1))/2)); %X position of the COM
COMH(i,2) = (((LASIS(i,2))+(RASIS(i,2))/2)); %Y position of the COM

COMD(i,1) = (((LHEAD(i,1))+(RHEAD(i,1))/2)); %X position of the COM
COMD(i,2) = (((LHEAD(i,2))+(RHEAD(i,2))/2)); %Y position of the COM

COMT(i,1) = (((LTRUNK(i,1))+(RTRUNK(i,1))/2)); %X position of the COM
COMT(i,2) = (((LTRUNK(i,2))+(RTRUNK(i,2))/2)); %Y position of the COM
end
%{
for i = 0:(length(COMH(:,1))-1)
    i = i+1;
    COMH(i,1) = COMH(i,1);
    COMH(i,2) = COMH(i,2);
end

for i = 0:(length(COMD(:,1))-1)
    i = i+1;
    COMD(i,1) = COMD(i,1);
    COMD(i,2) = COMD(i,2);
end

for i = 0:(length(COMT(:,1))-1)
    i = i+1;
    COMT(i,1) = COMT(i,1);
    COMT(i,2) = COMT(i,2);
end
%}
Hoffset(:,1) = COMD(:,1) - (COMD(5,1)-900);
Toffset(:,1) = COMT(:,1) - (COMT(5,1)-900);
Poffset(:,1) = COMH(:,1) - (COMH(5,1)-900);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%{
y = Hoffset(5:1:16000,1);
Y = fft(abs(y));

Fs = 100;                      % Sampling frequency                    
T = 1/Fs;                       % Sampling period       
L = length(Hoffset(:,1));       % Length of signal
t = (0:L-1)*T;                  % Time vector
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
f = Fs*(0:(L/2))/L;

figure(1)
plot(f',P1, 'r') 
axis([0 0.3 0 250])
title('Single-Sided Amplitude Spectrum of the Perturbation Signal')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fs = 100; 
t = 0:1/fs:10-1/fs;
x = RASISX(5:1:16000,1);
y = fft(x);
%y = highpass(y, 0.1); 
n = length(x);
f = (0:n-1)*(fs/n);
power = abs(y).^2/n;

y0 = fftshift(y);         % shift y values
f0 = (-n/2:n/2-1)*(fs/n); % 0-centered frequency range
power0 = abs(y0).^2/n;    % 0-centered power

plot(f0,power0)
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('Frequency')
ylabel('Power')
axis([.01 .3 0 10000000])
