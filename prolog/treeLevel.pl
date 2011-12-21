% Author: Federico Lombardi 1209582
% Data: 13/05/2011

treee([tree(I,D,S)|Rest], Lista):-
                             Root = I, RootD = D, RootS = S, bf([tree(I,D,S,Liv)|Rest], Lista, tree(Root,RootD,RootS), 0).

trasforma():- bf([tree(I,D,S,Liv)|Rest], Lista, tree(Root,RootD,RootS), 0).

bf([], [[]], _tree(Root,RootD,RootS), _PrevLevel).
bf([void|Rest], Ls, _tree(Root,RootD,RootS), _PrevLevel):- bf(Rest, Ls, tree(Root,RootD,RootS), PrevLevel).
bf([tree(I,D,S,Liv)|Rest], [[I|K]|L], tree(Root,RootD,RootS), PrevLevel):-
                                                                append(Rest,[S,D],Nodes), level(tree(I,D,S,Liv), tree(Root,RootD,RootS), 0),
                                                                (Liv=PrevLevel -> Ls=[K | L]; Ls=L, K=[]),
                                                               %intead of calling bf call transform to have tree with 4 params, then call bf
                                                                bf(Nodes, Ls, tree(Root,RootD,RootS), PrevLevel).

level(tree(I,_,_,Liv), tree(I,_,_), Cont):- Liv is Cont.

level(tree(I,D,S,Liv), tree(Root,RootD,RootS), Cont):-
                                                         Cont2 is Cont+1, ( level(tree(I,D,S,Liv), tree(RootD,RDD,RDS), Cont2);
                                                         level(tree(I,D,S,Liv), tree(RootS,RSD,RSS), Cont2) ).