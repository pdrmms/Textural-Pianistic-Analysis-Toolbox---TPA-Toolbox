clc
partsbydists; tabe=tabd; %produz "tabd" e "tabs", partições das distribuições (d)/(e), e (s)

rec1={}; rec2={};rec3={};
% f percorre tabd, que tem partições da mão direita
for f = 1:size(tabd,1)
    pdvez=tabd(f,:); % Partição da mão Direita da Vez
    % g percorre tabs, que tem partições da distr. sincrônica
    for g = 1:size(tabs,1)
        psvez=tabs(g,:);
        % h percorre tabd, que agora tem partições da mão direita (as mesmas)
        for h = 1:size(tabe,1)
            pevez=tabe(h,:);
        
        %monta uma por cima da outra, com mesma dimensão
        pmp = zeros(3,10);      
        pmp(1,1:size(pdvez,2))=pdvez;pmp(2,1:size(psvez,2))=psvez;pmp(3,1:size(pevez,2))=pevez;
        rec1=[rec1;pmp];%para comparar. antes do filtro
        %esse registro pré-filtragem é apenas para comparar com rec2, que registra após filtragem
        
        %agora se iniciam os filtros
        %filtro1 soma maior que 10
        rowsum = sum(pmp,2); if sum(rowsum) > 10; pmp=[]; end
        
        %filtro2 se (e) e/ou (d) tiver Dn igual a 5, (s) não pode ser
        %>0
        if 5-rowsum(3) ==0 & rowsum(2) > 0; pmp=[]; end %mão esquerda
        if 5-rowsum(1) ==0 & rowsum(2) > 0; pmp=[]; end %mão direita
        
        %filtro3 número de partes em (s) não pode ser maior que a sobra de
        %cada mão (se a mão direita tem 3 partes, por ex., (s) só pode ter
        %até 2 partes
        numelD=nnz(pdvez); numelS=nnz(psvez);numelE=nnz(pevez);
        if numelS > 5-numelD | numelS > 5-numelE; pmp=[]; end
        
        %filtro4
        if numelS > 5-rowsum(1) | numelS > 5-rowsum(3); pmp=[]; end
        rec2=[rec2;pmp];%para comparar. DEPOIS do filtro
        rec2{:};
        
        %o bloco abaixo pesa muito. é para codificar classes texturais
%            if ~isempty(pmp) 
 %               pmpalt=pmp; 
  %              pmpalt=LBsubs(pmpalt); %é uma pmp ALTernativa destinada a codificação em classes texturais. gravada em rec3
   %             rec3=[rec3;pmpalt];
            %end
        end
    end
end
