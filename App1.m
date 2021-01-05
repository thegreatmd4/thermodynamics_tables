clc; clear; close all;
% (CoolProp doesn't support some input-output pairs we need.)
% This app uses a function named EES.m
% EES.m is a coupling between Matlab & EES
% to read the Thermodynamics Tables
% Please read "read me.txt" before using it

%% Get Optimization Variable
Tm=-70;                                       % Example Tm

%% R-410a Cycle
T_3t=40+273;
T_4t=Tm-5+273;
h_3t=EES('H','T',T_3t,'x',0,'R410A','r');
h_4t=h_3t;
P_4t=EES('P','H',h_4t,'T',T_4t,'R410A','r');
P_1t=P_4t;
h_1t=EES('H','P',P_1t,'x',1,'R410A','r');
P_3t=EES('P','T',T_3t,'x',0,'R410A','r');
P_2t=P_3t;
s_1t=EES('S','P',P_1t,'x',1,'R410A','r');
s_2t=s_1t;
h_2t=EES('H','P',P_2t,'S',s_2t,'R410A','r');

%% R-23 Cycle
T_1b=-80+273;
h_1b=EES('H','T',T_1b,'x',1,'R23','r');
T_3b=Tm+5+273;
h_3b=EES('H','T',T_3b,'x',0,'R23','r');
h_4b=h_3b;
P_3b=EES('P','T',T_3b,'x',0,'R23','r');
P_2b=P_3b;
s_1b=EES('S','T',T_1b,'x',1,'R23','r');
s_2b=s_1b;
h_2b=EES('H','P',P_2b,'S',s_2b,'R23','r');

%% Calculate Compressors Work
QL=105;
mdot_R23=QL/(h_1b-h_4b);
mdot_R410A=mdot_R23*(h_2b-h_3b)/(h_1t-h_4t);

W1=mdot_R23*(h_2b-h_1b);
W2=mdot_R410A*(h_2t-h_1t);
OF=W1+W2;