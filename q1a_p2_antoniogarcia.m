%% P2 | EDI-38
%% Antônio Gouvêa Garcia
%% Questão 1a



close all;
clear;
clc;

% Coordenadas da seção
x_vertices = [0; 0.25; 0.25; 0; 0];
y_vertices = [0; 0; 0.7; 0.7; 0];
x_aco = [0.05; 0.05; 0.05; 0.20; 0.20; 0.20]; % Por se tratar de um problema de nFNC, não temos os dados de x_aco. Mas, desde que as barras estejam dispostas simetricamente em relação ao eixo Y, não há alteração no resultado final.
y_aco = [0.05; 0.13; 0.65; 0.05; 0.13; 0.65];

classe_concreto = 80;
classe_aco = 50;
gamac = 1.4;
gamas = 1.15;
Nd = 7.2;
Mxd = 0;
Myd = 0;

[At, d, e0, kx, ky] = dimensionamento_nFOC(classe_concreto, classe_aco, x_vertices, y_vertices, x_aco, y_aco, gamac, gamas, Nd, Mxd, Myd);
resultado = [At, d, e0, kx, ky];
disp(resultado);

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