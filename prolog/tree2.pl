% Author: Federico Lombardi 1209582
% Data: 10/05/2011

bf( [], [[]], Liv ).
bf( [void | Rest ], Ls, Liv):- bf(Rest, Ls, Liv).
bf( [tree(I,Dx,Sx) | Rest], [[I | K] | L]):- bf( [tree(I,Dx,Sx) | Rest], [[I | K] | L], 0).

bf( [tree(I,Dx,Sx) | Rest], [[I | K] | L], Liv):-  append(Rest, [Sx, Dx], Nodes),
                                                         level(tree(I,Dx,Sx),Liv,Result),
                                                    ((Result>Liv) -> Ls=[K | L]; Ls=L, K=[]), % put I in the first list ELSE in a new one
                                                    bf(Nodes, Ls, Cont2).

level([], L, R):- L is R.
level(tree(I,Dx,Sx), Liv, Result):- Liv2 is Liv+1, level(Dx, Liv2,Result1), level(Sx, Liv2,Result2),
                                          (Result1>Result2)->Result=Result1; Result=Result2.