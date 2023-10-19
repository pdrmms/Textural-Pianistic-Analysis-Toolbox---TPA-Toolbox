# Textural-Pianistic-Analysis-Toolbox---TPA-Toolbox

O Textural Pianistic Toolbox é um conjunto de rotinas, funções e dados para Matlab designado para operar e visualizar estruturas texturais pianísticas. Seu desenvolvimento é diretamente ligado à Universidade Federal do Rio de Janeiro.

Um conceito central da proposta é o que convencionou-se chamar de _partição manual pianística_ (_PMP_). Uma _PMP_ é uma configuração textural (partição rítmica) observada a partir da forma como suas partes encontram-se alocadas nas mãos do pianista em sua performance. Essa alocação, chamada de _distribuição manual pianística_ (_DMP_), pode dar-se em três posições (ou distribuições, como são chamadas):
  1) mão esquerda (distribuição _e_);
  2) mão direita (distribuição _d_);
  3) nas duas mãos simultaneamente, também chamada de sincrônica (distribuição _s_).

Tomando-se a partição (1.2²), por exemplo, várias possibilidades de distribuição de suas partes podem ser consideradas. Sâo elas:

![image](https://github.com/pdrmms/Textural-Pianistic-Analysis-Toolbox---TPA-Toolbox/assets/144931330/e64ffe79-6e79-436c-b989-86f7572b6ba4)
  
As quatro cifras mostradas anteriormente são exemplos de PMPs, uma vez que descrevem uma configuração textural -- partição (1.3), no caso -- e sua disposição nas mãos do pianista em uma perspectiva específica (distribuições _e_, _s_, _d_). Além dessa notação cifrada, PMPs também podem ser notadas como matrizes. Isso se dá sempre com três linhas, de forma que a linha inferior representa a distribuição _e_, a linha central representa a distribuição _s_, e a linha superior representa a distribuição _d_.

Considerando a grande quantidade de PMPs existentes, uma importante generalização é feita em relação às distribuições., com o intuito de facilitar a tarefa de enumerar o inventário dessas configurações. Ao invés de considerar a lateralidade exata das distribuições (esquerda e direita), passam-se a considerar apenas _classes de distribuição manual pianística_ (_DMPs_). As distribuições _e_ e _d_ são generalizadas para as classes de distribuição _a_ e _b_, que passam a designar _uma mão_, e _outra mão_, não importando tratar-se especificamente de direita ou esquerda. A distribuição sincrônica, _s_, permanece inallterada nesse caso. Com essa generaliação, as PMPs 1|-|2² e 2²|-|1 (ítens _f_ e _g_) passam a equivaler-se, uma vez que são o espelhamento uma da outra.

Basicamente, existem sete possibilidades de distribuições manuais pianísticas:

![image](https://github.com/pdrmms/Textural-Pianistic-Analysis-Toolbox---TPA-Toolbox/assets/144931330/2e7adc58-6453-475f-929f-e05190d1b0cf)

Observadas como classes, tem-se apenas cinco possibilidades:

![image](https://github.com/pdrmms/Textural-Pianistic-Analysis-Toolbox---TPA-Toolbox/assets/144931330/8f5132b4-b2d6-4be5-b2e7-546b1a511cf1)

Uma vez esgotada a formalização das possibilidades de alocação de conteúdos texturais nas mãos do pianista, parte-se para o inventário desses conteúdos em si. Essa tarefa é realizada através da Análise Particional (Gentil-Nunes, 2009), que fornece a taxonomia exaustiva das configurações texturais para determinada densidade-número (Dn). Considerando uma situação mais básica, em que cada dedo do pianista só aciona uma tecla de cada vez, tem-se Dn variando entre 1 e 10. Considerando as configurações texturais que podem ser conformadas nesse intervalo, tem-se ao todo 138 partições.

Cada uma das 138 partições é passível de inúmeras distribuições manuais, resultando em uma grande quantidade de PMPs. Ao todo, são 1.125 PMPs, adotando as classes de distribuição como referência (CDMP). A lista dessas 1.125 PMPs é criada através da função pmpbuilder.m.

As 1.125 PMPs descritas com partições e em classes de distribuição manual pianísticas podem ser ainda descritas tanto de maneira mais genérica quanto de maneira mais detalhada. Seguindo a proposta dos _espaços texturais_ propostos por Daniel Moreira (2019), uma partição pode ser codificada de forma mais genérica como uma _classe textural_. Nessa maneira de descrição, são considerados apenas dois tipos de partes rítmicas: linhas (L, identificada como uma parte de um único componente), e blocos (B, identificada como uma parte de mais de um componente). Assumindo ainda que esses dois tipos de partes podem apresentar-se em também em multiplicidade (Lx e By), Moreira realiza a taxonomia exaustiva desse espaço textural, identificando 8 classes texturais possíveis (Moreira, 2019, p. 26:

![image](https://github.com/pdrmms/Textural-Pianistic-Analysis-Toolbox---TPA-Toolbox/assets/144931330/94a04133-a30f-4d89-a534-e7861682eb48)

Através da generalização possibilitada pelas classes texturais, é possível classificar as 1.125 PMPs em apenas 79 configurações, apresentadas a seguir a partir do próprio reticulado de classes texturais:

![image](https://github.com/pdrmms/Textural-Pianistic-Analysis-Toolbox---TPA-Toolbox/assets/144931330/500d0d87-77ed-446d-b3b6-ad10cf2c0828)

A lista dessas 79 PMPs descritas em tc-space é construída através da função tcbuilderXY.m
