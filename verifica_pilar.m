%% Verificação de estabilidade de um pilar | Concreto I | Antônio Garcia
function [verificacao, f, count] = verifica_pilar(classe_concreto, classe_aco, gamac, gamas, Nd, Md, diametro_aco, x, y, xs, ys, m, z, prec)
    dL = z/m; % comprimento de cada subdivisão do pilar

    %% Passo 1
    f = 0; % valor inicialmente atribuído para a flecha
    e = Md/Nd; % excentricidade de Nd

    maxiter = 1000;
    count = 1;

    while count<maxiter
        yi = zeros(m,1);

        %% Passo 2
        Md = Nd*(e+f);
        [elu, ~, ~, k, ~] = verificacao_nFOC(classe_concreto, classe_aco, x, y, xs, ys, diametro_aco, gamac, gamas, Nd, -Md, 0);
        if elu == 0
            verificacao = 0;
            return;
        end
        
        %% Passos 3 e 4
        % caso y1
        curv = -k/1000;
        yi(1,1) = curv*dL^2/2;
        Md = Nd*(e+f-yi(1));
        [elu, ~, ~, k, ~] = verificacao_nFOC(classe_concreto, classe_aco, x, y, xs, ys, diametro_aco, gamac, gamas, Nd, -Md, 0);
        if elu == 0
            verificacao = 0;
            return;
        end

        %caso y2
        curv = -k/1000;
        yi(2,1) = curv*dL^2 +2*yi(1);
        Md = Nd*(e+f-yi(2));
        [elu, ~, ~, k, ~] = verificacao_nFOC(classe_concreto, classe_aco, x, y, xs, ys, diametro_aco, gamac, gamas, Nd, -Md, 0);
        if elu == 0
            verificacao = 0;
            return;
        end

        i = 3; % contador que percorre a discretização do pilar (3 até m)
        while i<=m
            curv = -k/1000;
            yi(i, 1) = dL^2*curv+2*(yi(i-1, 1))-yi(i-2, 1);
            Md = Nd*(e+f-yi(i));
            [elu, ~, ~, k, ~] = verificacao_nFOC(classe_concreto, classe_aco, x, y, xs, ys, diametro_aco, gamac, gamas, Nd, -Md, 0);
            if elu == 0
                verificacao = 0;
                return;
            end
            i = i+1;
        end

        if abs(f-yi(m,1))<=prec
            verificacao = 1;
            return;
        else
            f = yi(m,1);
            count = count+1;
        end
    end
    verificacao = 0;  % não convergiu dentro do máximo de iterações
end