% The script "tcbuilderXY" transcribes the list of all 1.126 existing PMPs (coded as partitions) to a list of 78 PMPs (coded as textural classes).
% 
% Usage:
%           tcbuilderXY
% Example:
%           tcbuilderXY
% 
%               ans =
% 
%                   [list of 78 PMPs referent to the pianist
%                   hand settings. It was hidden here for the sake of
%                   space]
% 
% Created in July 2023 under MATLAB 2022 (Mac OS)
%
% © Part of Pianistic Textural Analysis Toolbox - PTA Toolbox,
% Copyright ©2023, Pauxy Gentil Nunes Filho, Pedro Miguel de Moraes
% PArtiMus Research Group - PPGM-UFRJ
% See License.txt
% ==========

%converte as pmps de up-space para tc-space. cada linha é uma das
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
%agora temos uma coluna com os códigos, e ao lado outra com os espelhos.
% rastreamos onde os espelhos ocorrem na coluna normal.
pos=1:size(temp,1);
duo=[temp pos']%esse par é fundamental. se o elemento da esquerda for maior que o da direita, ele pode ser anulado. senão, deve ser mantido.

alvo=find(duo(:,1)<duo(:,2))%aqui estamos pegando o alvo a ser preservado (esquerda é menor ou igual a direita, logo não pode ser excluído)

temp(alvo)=[]%esvazia os índices a serem preservados
resposta=resposta(temp) %filtra
%tccodes=tccodes';
%tccodes=string(tccodes)
