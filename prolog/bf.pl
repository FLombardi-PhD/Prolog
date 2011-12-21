% Author: Federico Lombardi 1209582
% Data: 17/05/2011

bf([],[]).
bf([void|Rest], Ls):- bf(Rest, Ls).
bf([tree(I,D,S)|Rest], Ls):- append(Rest,[S,D],Nodes), bf(Nodes, Ls).
