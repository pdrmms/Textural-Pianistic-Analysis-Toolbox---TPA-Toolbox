%converte as pmps de up-space para tc-space. cada linha � uma das
clc

pmpbuilder;
tc={}; tccodes=[];tccodesmirros=[];
for f = 1:size(rec2)
tc{f}=PMPtc(rec2{f});
[code codemirror] =tccoder2classededistr(tc{f})
tempcode=string(code); tempcodemirror=string(codemirror);
tccodes=[tccodes;tempcode]; tccodesmirros=[tccodesmirros;tempcodemirror];
end
tc=tc';
resposta=unique(tccodes,'stable');
respostamirror=unique(tccodesmirros,'stable');
sidebyside = [resposta respostamirror]

temp=[];
for f = 1:size(sidebyside,1)
    rvez=sidebyside(f,2);
    ind=find(rvez==sidebyside(:,1));
    temp=[temp;ind];
end
%agora temos uma coluna com os c�digos, e ao lado outra com os espelhos.
% rastreamos onde os espelhos ocorrem na coluna normal.
pos=1:size(temp,1);
duo=[temp pos']%esse par � fundamental. se o elemento da esquerda for maior que o da direita, ele pode ser anulado. sen�o, deve ser mantido.

alvo=find(duo(:,1)<duo(:,2))%aqui estamos pegando o alvo a ser preservado (esquerda � menor ou igual a direita, logo n�o pode ser exclu�do)

temp(alvo)=[]%esvazia os �ndices a serem preservados
resposta=resposta(temp) %filtra
%tccodes=tccodes';
%tccodes=string(tccodes)