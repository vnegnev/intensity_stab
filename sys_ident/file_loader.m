% import the various time-domain data from the control system for system
% identification.

clc;clear;close all hidden;

% Periods of 10us, 5us, 2us and 1us
data_1us = importdata('vn_square_wave_110mV_excitation_1us_per_div.csv',';',5);
data_2us = importdata('vn_square_wave_110mV_excitation_2us_per_div.csv',';',5);
data_5us = importdata('vn_square_wave_110mV_excitation_5us_per_div.csv',';',5);
data_10us = importdata('vn_square_wave_110mV_excitation_10us_per_div.csv',';',5);

data_1us_t = data_1us.data(:,1);
data_1us_in = data_1us.data(:,2);
data_1us_out = data_1us.data(:,3);

data_2us_t = data_2us.data(:,1);
data_2us_in = data_2us.data(:,2);
data_2us_out = data_2us.data(:,3);

data_5us_t = data_5us.data(:,1);
data_5us_in = data_5us.data(:,2);
data_5us_out = data_5us.data(:,3);

data_10us_t = data_10us.data(:,1);
data_10us_in = data_10us.data(:,2);
data_10us_out = data_10us.data(:,3);

plot(data_1us_t,data_1us_in,'r',data_1us_t,data_1us_out,'b')
hold on
plot(data_2us_t,data_2us_in,'r',data_2us_t,data_2us_out,'b')
plot(data_5us_t,data_5us_in,'r',data_5us_t,data_5us_out,'b')
plot(data_10us_t,data_10us_in,'r',data_10us_t,data_10us_out,'b')
