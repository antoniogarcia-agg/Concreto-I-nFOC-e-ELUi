% Materiais
classe_concreto = 20;
classe_aco = 50;
gamac = 1.4;
gamas = 1.15;

% Esforços
Nd = 0.3643;
Md = 0.0607;

% Geometria
x = [0; 0.2; 0.2; 0; 0];
y = [0; 0; 0.5; 0.5; 0];
xs = [0.1; 0.1];
ys = [0.025; 0.475];
As = 11.17/20000;
d = sqrt(As/(0.25*pi));
diametro_aco = [d; d];

% Algoritmo iterativo
m = 5;
z = 5;
prec = 1e-10;

[verificacao, f, count] = verifica_pilar(classe_concreto, classe_aco, gamac, gamas, Nd, Md, diametro_aco, x, y, xs, ys, m, z, prec);

resultado = [verificacao, f, count];
disp(resultado);

fprintf("%.8f", f);