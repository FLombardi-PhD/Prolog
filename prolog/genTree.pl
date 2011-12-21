% Author:  Federico Lombardi 1209582
% Date: 15/05/2011

genTree(void,[]).
genTree(tree(I,D,S), Levels) :- append([], [I], X), bfLevels([tree(I,D,S)], X, [], [], Tree), append([[I]], Tree, Levels), !.

% modified breadth-first search: returns a list where each element j is a list containing nodes at levelj
bfLevels([], X, Y, Z, Z).
bfLevels([void|Rest], X, Y, Z, Tree) :- bfLevels(Rest, X, Y, Z, Tree).
bfLevels([tree(I,D,S)|Rest], X, Y, Z, Tree) :-  append(Rest, [S,D], Nodes),
                                                   idChild(S, SID), idChild(D, DID),
                                                   ( member(I, X) -> append(Y, [SID,DID], Ly), bfLevels(Nodes, X, Ly, Z, Tree) ;
                                                   append(Z, [Y], Lz), append([], [SID,DID], Lx), bfLevels(Nodes, Y, Lx, Lz, Tree) ).
                                                   
% Returns the id of the Child
idChild(void,void).
idChild(tree(I,D,S), I).

member(I,[I|Rest]).
member(I,[K|Ks]) :- member(I,Ks).





