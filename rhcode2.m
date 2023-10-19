function rhcode2 = rhcode(lhcode, nline)
% rhcode2 é uma função que retorna uma lista de possibilidade para a mão 
% direita que se encaixma à linha de lhcode definida pelo 
% número da linha (nline).
list = lhcode;
nfg = 5;% número de dedos igual a cinco.
af = permn([1 0],nfg); % combinações de zeros e um.
af(find(sum(af,2)==0),:)=[]; % lista de 31 combinações
lhline = list(nline,:); % seleção da linha de lhcode
maxlhline = max(lhline); % valor máximo de lhline
rhcode2 = [];
    for f = 1:size(af,1) % loop de af (31 combinações, parcial)
        afline = af(f,:); % seleção da combinação
        pospdg = find(afline==1);
        npos = numel(pospdg); % dedos ativos
        letters = [1:maxlhline+npos]; % escopo do permn
        dg2 = permn(letters,npos); % permn em si, milhares de resultados
        chosen = [];
        trash = [];
            for g = 1:size(dg2,1) % loop de filtragem das linhas válidas
            linha = dg2 (g,:); % seleciona a linha de dg2
            % testa gaps
                if rgaps(linha, maxlhline)== 1
                    chosen = [chosen; g];
                else
                    trash = [trash; g];
                end
            dg2chosen = dg2(chosen,:); % pinça lista de linhas válidas
            dg2trash = dg2(trash,:); % pinça excluídos
            tab = zeros(size(dg2chosen,1),5); % aloca espaço para essa lista
            tab(:,pospdg) = dg2chosen;
            end
        rhcode2 = [rhcode2; tab];
    end
    dg2trash;
end

%=========================================
% A função "gaps" retorna 1 quando as linhas têm intervalos maiores
% do que 1  entre elementos consecutivos - por exemplo, 113.
function result = rgaps(linha, maxlhline)
ordem = 0;
sucessor = 0;
sumula = sort([linha maxlhline]);
ints = diff(sumula);
ind = numel(find(ints > 1));
if any(ismember(linha, maxlhline|maxlhline+1))
    sucessor = 1;
end
if crescent (linha (linha > maxlhline)) == 1
    ordem = 1;
end
teste = [ind sucessor ordem];
    if teste == [0 1 1]
        result = 1;
    else
        result = 0;
    end
end

%=========================================
% A função "crescent" seleciona as linhas em que a ordem dos números, 
% desconsiderando repetições, é ascendente. 
% Isso excluirá resultados que não começam em 1 
% (por exemplo, 221), além de outros como 132, por exemplo. 
% Para isso, seleciono linha por linha.
% Agora testo as diferenças entre elementos consecutivos 
% de um vetor com exclusão de repetições; 
% se houver algum valor negativo, anoto o número da linha.

function result = crescent(linha)
    if min(diff (unique (linha, 'stable')))<0
        result = 0;
    else
        result = 1;
    end
end