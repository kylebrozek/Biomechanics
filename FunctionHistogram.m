function [HistogramF] = FunctionHistogram(Data, Angle)
%% Kyle Brozek
%    
a = 1;
b = 1;
c = 1;
d = 1;
e = 1;
f = 1;
g = 1;
h = 1;
ii = 1;
j = 1;
k = 1;
l = 1;
m = 1;
n = 1;
o = 1;
p = 1;
q = 1;
r = 1;
s = 1;
t = 1;
u = 1;
v = 1;
w = 1;
x = 1;
y = 1;
z = 1;
aa = 1;
ab = 1;
ac = 1;
ad = 1;
ae = 1;
af = 1;
ag = 1;
ah = 1;
ai = 1;
aj = 1;
ak = 1;
al = 1;

Data1(:,1) = (Data(:,15))./(Data(:,16)); 

for i = 1600:14401
if  (162 < Angle(i,1)) && (Angle(i,1) < 163)                              %if the platform is between -19 and -18;
    Histogram(a,1) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    a = a+1; 
end
if (163 < Angle(i,1)) && (Angle(i,1) < 164)                       %if the platform is between -18 to -17 degrees
    Histogram(b,2) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    b = b+1;
end 
if  (164 < Angle(i,1)) && (Angle(i,1) < 165)                        %if the platform is between -17 and -16;
    Histogram(c,3) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    c = c+1;
end 
if (165 < Angle(i,1)) && (Angle(i,1) < 166)                        %if the platform is between -16 to -15 degrees
    Histogram(d,4) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    d = d+1;
end
if  (166 < Angle(i,1)) && (Angle(i,1) < 167)                        %if the platform is between -15 and -14;
    Histogram(e,5) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    e = e+1;
end 
if (167 < Angle(i,1)) && (Angle(i,1) < 168)                         %if the platform is between -14 to -13 degrees
    Histogram(f,6) = Data1(i,1);                 %first column of our matrix contains all the sacrumx points at that range
    f = f+1;
end 
if  (168 < Angle(i,1)) && (Angle(i,1) < 169)                        %if the platform is between -13 and -12;
    Histogram(g,7) = Data1(i,1);                 %first column of our matrix contains all the sacrumx points at that range
    g = g+1;
end 
if (169 < Angle(i,1)) && (Angle(i,1) < 170)                        %if the platform is between -12 to -11 degrees
    Histogram(h,8) = Data1(i,1);                 %first column of our matrix contains all the sacrumx points at that range
    h = h+1;
end 
if  (170 < Angle(i,1)) && (Angle(i,1) < 171)                       %if the platform is between -11 and -10;
    Histogram(ii,9) = Data1(i,1);                 %first column of our matrix contains all the sacrumx points at that range
    ii = ii+1;
end 
if (171 < Angle(i,1)) && (Angle(i,1) < 172)                         %if the platform is between -10 to -9 degrees
    Histogram(j,10) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    j = j+1;
end 
if  (172 < Angle(i,1)) && (Angle(i,1) < 173)                        %if the platform is between -9 and -8;
    Histogram(k,11) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    k = k+1;
end 
if (173 < Angle(i,1)) && (Angle(i,1) < 174)                         %if the platform is between -8 to -7 degrees
    Histogram(l,12) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    l = l+1;
end 
if  (174 < Angle(i,1)) && (Angle(i,1) < 175)                       %if the platform is between -7 and -6;
    Histogram(m,13) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    m = m+1;
end 
if (175 < Angle(i,1)) && (Angle(i,1) < 176)                       %if the platform is between -6 to -5 degrees
    Histogram(n,14) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    n = n+1;
end 
if  (176 < Angle(i,1)) && (Angle(i,1) < 177)                        %if the platform is between -5 and -4;
    Histogram(o,15) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    o = o+1;
end 
if (177 < Angle(i,1)) && (Angle(i,1) < 178)                        %if the platform is between -4 to -3 degrees
    Histogram(p,16) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    p = p+1;
end 
if  (178 < Angle(i,1)) && (Angle(i,1) < 179)                        %if the platform is between -3 and -2;
    Histogram(q,17) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    q = q+1;
end 
if (179 < Angle(i,1)) && (Angle(i,1) < 180)                        %if the platform is between -2 to -1 degrees
    Histogram(r,18) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    r = r+1;
end 
if  (Angle(i,1) < 1)                        %if the platform is between -1 and 0;
    Histogram(s,19) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    s = s+1;
end 
if  (1 < Angle(i,1)) && (Angle(i,1) < 2)                          %if the platform is between 0 to 1 degrees
    Histogram(t,20) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    t = t+1;
end 
if  (2 < Angle(i,1)) && (Angle(i,1) < 3)                          %if the platform is between 1 to 2 degrees
    Histogram(u,21) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    u = u+1;
end 
if  (3 < Angle(i,1)) && (Angle(i,1) < 4)                          %if the platform is between 2 to 3 degrees
    Histogram(v,22) = Data1(i,1);               %first column of our matrix contains all the sacrumx points at that range
    v = v+1;
end 
if  (4 < Angle(i,1)) && (Angle(i,1) < 5)                          %if the platform is between 3 to 4 degrees
    Histogram(w,23) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    w = w+1;
end 
if  (5 < Angle(i,1)) && (Angle(i,1) < 6)                          %if the platform is between 4 to 5 degrees
    Histogram(x,24) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    x = x+1;
end 
if  (6 < Angle(i,1)) && (Angle(i,1) < 7)                          %if the platform is between 5 to 6 degrees
    Histogram(y,25) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    y = y+1;
end 
if  (7 < Angle(i,1)) && (Angle(i,1) < 8)                          %if the platform is between 6 to 7 degrees
    Histogram(z,26) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    z = z+1;
end 
if  (8 < Angle(i,1)) && (Angle(i,1) < 9)                          %if the platform is between 7 to 8 degrees
    Histogram(aa,27) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    aa = aa+1;
end 
if  (9 < Angle(i,1)) && (Angle(i,1) < 10)                          %if the platform is between 8 to 9 degrees
    Histogram(ab,28) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    ab = ab+1;
end 
if  (10 < Angle(i,1)) && (Angle(i,1) < 11)                          %if the platform is between 9 to 10 degrees
    Histogram(ac,29) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    ac = ac+1;
end 
if  (11 < Angle(i,1)) && (Angle(i,1) < 12)                          %if the platform is between 10 to 11 degrees
    Histogram(ad,30) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    ad = ad+1;
end 
if  (12 < Angle(i,1)) && (Angle(i,1) < 13)                          %if the platform is between 11 to 12 degrees
    Histogram(ae,31) = Data1(i,1);               %first column of our matrix contains all the sacrumx points at that range
    ae = ae+1;
end 
if  (13 < Angle(i,1)) && (Angle(i,1) < 14)                          %if the platform is between 12 to 13 degrees
    Histogram(af,32) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    af = af+1;
end 
if  (14 < Angle(i,1)) && (Angle(i,1) < 15)                          %if the platform is between 13 to 14 degrees
    Histogram(ag,33) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    ag = ag+1;
end 
if  (15 < Angle(i,1)) && (Angle(i,1) < 16)                         %if the platform is between 14 to 15 degrees
    Histogram(ah,34) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    ah = ah+1;
end 
if  (16 < Angle(i,1)) && (Angle(i,1) < 17)                          %if the platform is between 15 to 16 degrees
    Histogram(ai,35) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    ai = ai+1;
end 
if  (17 < Angle(i,1)) && (Angle(i,1) < 18)                          %if the platform is between 16 to 17 degrees
    Histogram(aj,36) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    aj = aj+1;
end 
if  (18 < Angle(i,1)) && (Angle(i,1) < 19)                          %if the platform is between 17 to 18 degrees
    Histogram(ak,37) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    ak = ak+1;
end 
if  (19 < Angle(i,1)) && (Angle(i,1) < 20)                          %if the platform is between 18 to 19 degrees
    Histogram(al,38) = Data1(i,1);                %first column of our matrix contains all the sacrumx points at that range
    al = al+1;
end 
end

for k = 1:38
    HistogramF(1,k) = std(Histogram(:,k));
end