%% Exame | EDI-38
%% Antônio Gouvêa Garcia
%% Questão 5b



close all;
clear;
clc;

% Materiais
classe_concreto = 75;
classe_aco = 50;
gamac = 1.4;
gamas = 1.15;

% Geometria
x = [0; 0.2; 0.2; 0; 0];
y = [0; 0; 0.2; 0.2; 0];
xs = [0.03; 0.03; 0.03; 0.17; 0.17; 0.17];
ys = [0.03; 0.1; 0.17; 0.03; 0.1; 0.17];
diametro_aco = [0.01; 0.01; 0.01; 0.01; 0.01; 0.01];
z = 2;

compressao_uniforme(classe_concreto, classe_aco, gamac, gamas, diametro_aco, x, y, xs, ys, z);

