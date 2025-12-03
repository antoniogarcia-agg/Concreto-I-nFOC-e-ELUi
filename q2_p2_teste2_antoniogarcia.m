%% P2 | EDI-38
%% Antônio Gouvêa Garcia
%% Questão 2 - teste com mais 1 barra



close all;
clear;
clc;

% Coordenadas da seção
x_vertices = [0; 5; 4.25; 3; 2.75; 2.75; 3; 4.25; 4.5; 4.5; 4.25; 5; 5; 6; 6; -1; -1; 0; 0.75; 2; 2.25; 2.25; 2; 0.75; 0.5; 0.5; 0.75; 0; 0];
y_vertices = [0; 0; 0.3; 0.3; 0.55; 1.45; 1.7; 1.7; 1.45; 0.55; 0.3; 0; 1.7; 1.8; 2; 2; 1.8; 1.7; 1.7; 1.7; 1.45; 0.55; 0.3; 0.3; 0.55; 1.45; 1.7; 1.7; 0];
x_aco = [0.09; 0.375; 0.66;  1.7; 2.02; 2.34; 2.5; 2.66; 2.98;  3.3; 4.34; 4.625; 4.91; 0.09; 2.34; 2.66; 4.91; 0.09; 2.34; 2.66; 4.91];
y_aco = [0.09;  0.09;  0.09; 0.09; 0.09; 0.09; 0.09; 0.09; 0.09; 0.09; 0.09;  0.09; 0.09; 0.32; 0.32; 0.32; 0.32; 0.55; 0.55; 0.55; 0.55];
%diametro_aco = [0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032; 0.032];
classe_concreto = 80;
classe_aco = 50;
gamac = 1.4;
gamas = 1.15;
Nd = 2.5;
Mxd = -10;
Myd = 5;

[At, d, e0, kx, ky] = dimensionamento_nFOC(classe_concreto, classe_aco, x_vertices, y_vertices, x_aco, y_aco, gamac, gamas, Nd, Mxd, Myd);

[x_vertices,y_vertices, x_aco, y_aco] = translacao_cg(x_vertices, y_vertices, x_aco, y_aco);

if (~isnan(d))
    plot(x_vertices,y_vertices,'-r');
    xlabel('x');
    ylabel('y');
    title('Seção Transversal e LN');
    hold on;
    grid on;    
    plot(x_aco, y_aco, '.b');
    v = 0.05; % fator para descentralizar o plot
    
    g = @(x) (ky*x + e0) / kx; % Sabendo que kx = 0
    
    ylim([min(y_vertices)-v, max(y_vertices)+v]);
    
    fplot(g,[min(x_vertices)-v, max(x_vertices)+v],'--k','LineWidth',1);
end