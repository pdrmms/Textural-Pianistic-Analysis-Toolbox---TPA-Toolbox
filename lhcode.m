function allcombs = lhcode
% The function "lhcode" generates a list of all fingercodes relative to one
% hand of the pianist (in this case, named as the "left hand", but could be
% applied to the right hand if it is the case).
% 
% Usage:
%           lhcode
% Example:
%           lhcode
% 
%               ans =
% 
%                   [list of 202 fingercodes referent to one pianist hand.
%                   It was hidden here for the sake of space]
% 
% Created in July 2023 under MATLAB 2022 (Mac OS)
%
% � Part of Pianistic Textural Analysis Toolbox - PTA Toolbox,
% Copyright �2023, Pauxy Gentil Nunes Filho, Pedro Miguel de Moraes
% PArtiMus Research Group - PPGM-UFRJ
% See License.txt
% ==========
nfg = 5;
af = permn([1 0],nfg);
af(find(sum(af,2)==0),:)=[];
ind0 = find(af(:,1)==0);
letters = [1:nfg];
allcombs = [];
for f = 1:size(af,1)
    pospdg = find(af(f,:));
    dg = numel(pospdg);
    nz = nfg-dg;
    seg = letters(1:dg);
    dg2 = permn(seg,max(seg));
    chosen = [];
    for g = 1:size(dg2, 1)
        linha = dg2 (g,:);
        if gaps(linha)== 0
            if haveone(linha)== 1
                if crescent (linha) == 1
                    chosen = [chosen; g];
                end
            end
        end
        dg2chosen = dg2(chosen,:);
        tab = zeros(size(dg2chosen,1),5);
        tab(:,pospdg) = dg2chosen;
    end
    allcombs = [allcombs; tab];
end
allcombs;
size(allcombs);

% allfcodes = [];
% for f = 1:size(allcombs,1)
%     allcombline = allcombs(f,:);
%     for g = 1:size(allcombs,1)
%         allfcodes = [allfcodes; allcombline, allcombs(g,:);...
%             lrmount(allcombline)];
%     end
% end
% allfcodes = allfcodes;
% sz = size(allfcodes);
end

%=========================================
% A função "gaps" retorna 1 quando as linhas têm intervalos maiores
% do que 1  entre elementos consecutivos - por exemplo, 113.
function result = gaps(linha)
alvo = [];
pos = 1;
ints = diff(unique(linha, 'stable'));
ind = find(ints>1);
    if size(ind)>0
        result = 1;
    else
        result=0;
    end
end

%=========================================
% A função "haveone" retorna 1 quando a linha contém o valor 1, 
% uma vez que essa ausência implicaria em uma leitura reduzida. 
% Por exemplo, 232 deve ser lido, na verdade, como 121.

function result = haveone(linha)
n = find(linha==1);
    if size(n,2)==0
        result=0;
    else
        result=1;
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