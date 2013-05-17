% Run simulink model of the controller; sweep the gain and see the effects
% on the FFT of the noise.

clc;clear;close all hidden

fg_list = [0,1,2,3,4,5];
fgL = length(fg_list);
n=cell(1,fgL);
y=cell(1,fgL);
nfa=cell(1,fgL);
yfa=cell(1,fgL);

for k = 1:length(fg_list)
    fg = fg_list(k);
    sim('plant_tf_test_a')
    t = simout.time;
    L = 2^nextpow2(length(t));
    n{k} = simout.signals.values(:,1);
    y{k} = simout.signals.values(:,2);
    nfabs = abs(fft(n{k},L)/L).^2;
    nfabsf = filter(ones(1,100)/100,1,nfabs);
    nfa{k} = nfabsf(1:L/2+1);
    yfabs = abs(fft(y{k},L)/L).^2;
    yfabsf = filter(ones(1,100)/100,1,yfabs);
    yfa{k} = yfabsf(1:L/2+1);
end

T = t(2)-t(1);
Fs = 1/T;
fx = Fs/2*linspace(0,1,L/2+1);

nfam = cell2mat(nfa);
yfam = cell2mat(yfa);

loglog(fx, yfam)

% for k=1:length(fg_list)
%     loglog(fx, nfa{k}, 'r', fx, yfa{k},'b')
%     hold on
% end