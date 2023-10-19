# Textural-Pianistic-Analysis-Toolbox---TPA-Toolbox

O Textural Pianistic Toolbox é um conjunto de rotinas, funções e dados para Matlab designado para operar e visualizar estruturas texturais pianísticas. Seu desenvolvimento é diretamente ligado à Universidade Federal do Rio de Janeiro.

Um conceito central da proposta é o que convencionou-se chamar de _partição manual pianística_ (_PMP_). Uma _PMP_ é uma configuração textural (partição rítmica) observada a partir da forma como suas partes encontram-se alocadas nas mãos do pianista em sua performance. Essa alocação, chamada de _distribuição manual pianística_ (_DMP_), pode dar-se em três posições (ou distribuições, como são chamadas):
  1) mão esquerda (distribuição _e_);
  2) mão direita (distribuição _d_);
  3) nas duas mãos simultaneamente, também chamada de sincrônica (distribuição _s_).
Tomando-se a partição (1.3), por exemplo, várias possibilidades de distribuição de suas partes podem ser consideradas. Sâo elas:
  1) 1.3|-|-, em que todas as partes encomtra-se na mão esquerda;
  2) 1|3|-, em que a parte (1) encontra-se na mão esquerda, e a parte (3) distribuída entre as duas mãos; 
  3) 1|-|3, em que a parte (1) encontra-se na mão esquerda, e a parte (3) na mão direita;
  4) -|-|1.3, em que as duas partes encontram-se na mão direita.

As quatro cifras mostradas anteriormente são exemplos de PMPs, uma vez que descrevem uma configuração textural e sua disposição nas mãos do pianista em relação a certos aspectos (distribuições _e_, _s_, _d_). Além da notação cifrada, PMPs também podem ser notadas como matrizes, sempre com três linhas, de forma que a linha inferior sempre representa a distribuição _e_, a linha central sempre representa a distribuição _s_, e a linha superior sempre representa a distribuição _d_.
A _manual pianistic partition_,_PMP_for short, is a textural configuration observed from its arrangement in the pianist's hands.
