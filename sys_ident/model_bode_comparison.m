% Compare Bode plot taken of system with Digilent Analog Discovery Kit to
% the system-identified model
clc;clear;close all hidden;
% Process model plot
s=tf('s');

% Parameters calculated by Sys Ident Toolbox
freq_conv = 3.5*1e7/1e6;
Kp = -0.21;%-0.19411;
Tw = 7.0698/freq_conv;
Zeta = 0.33669;
Td = 5/freq_conv;%21.131/freq_conv;

G_p2du = Kp / (1 + 2*Zeta*Tw*s + (Tw*s)^2) * exp(-Td*s);
G_pade = pade(G_p2du,3);

[mag,ph,wout] = bode(G_pade);
freq = wout/2/pi;%wout*1e6*2*pi;

% Importing Bode data
bode_data = importdata('vn_bode_plot_digilent_waveforms_data.txt','\t',5);
b_freq = bode_data.data(:,1)/1e6;
b_mag = bode_data.data(:,3)./bode_data.data(:,2);
b_ph = bode_data.data(:,4)+180;

subplot(2,1,1)
loglog(freq,squeeze(mag),'r',b_freq,b_mag,'b')
subplot(2,1,2)
semilogx(freq,mod(squeeze(ph),360),'r',b_freq,b_ph,'b')
xlabel('Frequency (Hz)')

figure;
G = G_pade;
F = 1;
YD0 = G/(1+G);
YD = G/(1+F*G);
%bode(G,YD0,YD)
for k=-4:1:0
    TF = G/(1+k*G);
    hold on
    impulse(TF)
end