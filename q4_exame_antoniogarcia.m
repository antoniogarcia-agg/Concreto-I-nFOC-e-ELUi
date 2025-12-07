%% Exame | EDI-38
%% Antônio Gouvêa Garcia
%% Questão 4



close all;
clear;
clc;

% Propriedades dos materiais
classe_concreto = 75;
classe_aco = 50;
gamac = 1.4;
gamas = 1.15;

% Coordenadas da seção
x_vertices = [0; 0.2; 0.2; 0; 0];
y_vertices = [0; 0; 0.2; 0.2; 0];
x_aco = [0.03; 0.03; 0.03; 0.17; 0.17; 0.17];
y_aco = [0.03; 0.1; 0.17; 0.03; 0.1; 0.17];
[x_vertices,y_vertices, x_aco, y_aco] = translacao_cg(x_vertices, y_vertices, x_aco, y_aco); % Importante para a plotagem

% Solicitações item a
Nd = -0.100;
Mxd = 0;
fprintf("a)\n");
dimensionamento_nFOC(classe_concreto, classe_aco, x_vertices, y_vertices, x_aco, y_aco, gamac, gamas, Nd, Mxd, 0, "a");

% Solicitações item b
Nd = 0;
Mxd = 0.010;
fprintf("b)\n");
dimensionamento_nFOC(classe_concreto, classe_aco, x_vertices, y_vertices, x_aco, y_aco, gamac, gamas, Nd, Mxd, 0, "b");

% Solicitações item c
Nd = 0.5;
Mxd = -0.030;
fprintf("c)\n");
dimensionamento_nFOC(classe_concreto, classe_aco, x_vertices, y_vertices, x_aco, y_aco, gamac, gamas, Nd, Mxd, 0, "c");

% Solicitações item d
Nd = 1.5;
Mxd = 0.013;
fprintf("d)\n");
dimensionamento_nFOC(classe_concreto, classe_aco, x_vertices, y_vertices, x_aco, y_aco, gamac, gamas, Nd, Mxd, 0, "d");

% Solicitações item e
Nd = 2.1;
Mxd = 0;
fprintf("e)\n");
dimensionamento_nFOC(classe_concreto, classe_aco, x_vertices, y_vertices, x_aco, y_aco, gamac, gamas, Nd, Mxd, 0, "e");

