%% Exame | EDI-38
%% Antônio Gouvêa Garcia
%% Questão 1



%% Plot da seção poligonal + barras + linha neutra
close all; clear; clc;

% Dados da seção (concreto)
x = [-10  10   5  -5  -5   5   5  10  10 -10];   % xi (cm)
y = [-25 -25 -20 -20  20  20 -20 -25  25  25];   % yi (cm)

% Fecha o polígono (repete o primeiro ponto no final)
x_sec = [x x(1)];
y_sec = [y y(1)];

% Dados das barras
xs = [-7.5  7.5  7.5 -7.5];   % xsi (cm)
ys = [-22.5 -22.5 22.5 22.5]; % ysi (cm)

% Linha neutra: y = -10 - 4x
xLN = linspace(min(x_sec)-5, max(x_sec)+5, 200);
yLN = -10 - 4*xLN;

% Plot
figure; hold on; grid on; axis equal;

% Seção de concreto (polígono preenchido)
patch(x_sec, y_sec, [0.85 0.85 0.85], ...
      'EdgeColor', 'k', 'LineWidth', 1.5);

% Barras de armadura (pontos ou “bolinhas”)
plot(xs, ys, 'ko', 'MarkerFaceColor', 'k', 'MarkerSize', 6);

% Linha neutra
plot(xLN, yLN, 'r--', 'LineWidth', 1.5);

% Eixos e legenda
xlabel('x (cm)');
ylabel('y (cm)');
title('Seção poligonal, barras e linha neutra');

hold off;