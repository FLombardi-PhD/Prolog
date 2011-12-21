% Author: Federico Lombardi 1209582
% Data: 17/05/2011

bf(tree(I,D,S), Ls):- children(S, L1, Lr1, SI),
                      children(D, L2, Lr2, DI),
                      append(L1, L2, L12),
                      append(Lr1, Lr2, Lr12),
                      %( Lr12\=[] -> append([L12], [Lr12], Lt); L12\=[] -> append([L12], [], Lt) ); Lt=[] ),
                      ( Lr12\=[], L12\=[] -> append([L12], [Lr12], Lt); L12=[] -> Lt=[]; append([L12], [], Lt) ),
                      %append([L12], [Lr12], Lt),
                      append([[SI,DI]], Lt, Ltt),
                      append([[I]], Ltt, Ls)
                      .
                      
                      
children(void, [], [], _).
children(tree(I,D,S), Lz, Lt, I):- children(S, L1, Lr1, SI),
                                children(D, L2, Lr2, DI),
                                ((S\=void, D\=void)-> append(L1, L2, L12),
                                append(Lr1, Lr2, Lr12),
                                (L12\=[] -> append(L12, Lr12, Lt); Lt=[]),
                                append([SI,DI],[], Lz);
                                Lz=[], Lt=[]).