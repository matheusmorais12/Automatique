%% Automatique 1 - Bureau d'Etudes 1.1

clear;
close all;
clc;


%% Processo

% Variável de Laplace
s = tf('s');

% Parâmetros
k1 = 0.6;
k2 = -0.25;
tau = 5;

G = 1/(1 + tau*s)^2;


%% Controlador

% Parâmetros
Kp = 4;
Ti = 10;
Td = 2.5;
alpha = 100*Td;

C = Kp*(1 + (1/Ti)*(1/s) + (Td*s)/(1 + (Td/alpha)*s));


%% Simulação

% Tempo de simulação
tsim = 50;

% Sinal de pertubação
tv = 25;
vf = 0.5;

sim('sim_1_1');