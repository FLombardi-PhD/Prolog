% Autore: Federico Lombardi
% Date: 10/05/2011

bf([],[]).
bf([void|Rest], Ls):- bf(Rest, Ls).
bf([tree(I,Dx,Sx)|Rest], [I|Ls]):- append(Rest, [Sx, Dx], Nodes), bf(Nodes, Ls).