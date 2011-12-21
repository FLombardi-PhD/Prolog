% Author: Federico Lombardi 1209582
% Date: 17/04/2011

compute(S, C, AVG):- C\=0, AVG is S/C.
compute(S, C, AVG):- C=0, AVG is 0.

% average informatics exams

avgInf([], 0).
avgInf([exam(X, Y, Z)|Xs], AVG):- sumInf([exam(X, Y, Z)|Xs], S), countInf([exam(X, Y, Z)|Xs], C), compute(S, C, AVG), !.

sumInf([exam(X, Y, Z)|Xs], Sum):- sumInf([exam(X, Y, Z)|Xs], 0, Sum).
sumInf([], Sum, Sum).
sumInf([exam(X, Y, Z)|Xs], Acc, Sum):- Z="cs", Acc1 is Acc+Y, sumInf(Xs, Acc1, Sum).
sumInf([exam(X, Y, Z)|Xs], Acc, Sum):- Z\="cs", sumInf(Xs, Acc, Sum).

countInf([exam(X, Y, Z)|Xs], C):- countInf([exam(X, Y, Z)|Xs], 0, C).
countInf([], C, C).
countInf([exam(X, Y, Z)|Xs], Acc, C):- Z="cs", Acc1 is Acc+1, countInf(Xs, Acc1, C).
countInf([exam(X, Y, Z)|Xs], Acc, C):- Z\="cs", countInf(Xs, Acc, C).

% avg exams non informatics

avgNonInf([], 0).
avgNonInf([exam(X, Y, Z)|Xs], AVG):- sumNonInf([exam(X, Y, Z)|Xs], S), countNonInf([exam(X, Y, Z)|Xs], C), compute(S, C, AVG), !.

sumNonInf([exam(X, Y, Z)|Xs], Sum):- sumNonInf([exam(X, Y, Z)|Xs], 0, Sum).
sumNonInf([], Sum, Sum).
sumNonInf([exam(X, Y, Z)|Xs], Acc, Sum):- Z\="cs", Acc1 is Acc+Y, sumNonInf(Xs, Acc1, Sum).
sumNonInf([exam(X, Y, Z)|Xs], Acc, Sum):- Z="cs", sumNonInf(Xs, Acc, Sum).

countNonInf([exam(X, Y, Z)|Xs], C):- countNonInf([exam(X, Y, Z)|Xs], 0, C).
countNonInf([], C, C).
countNonInf([exam(X, Y, Z)|Xs], Acc, C):- Z\="cs", Acc1 is Acc+1, countNonInf(Xs, Acc1, C).
countNonInf([exam(X, Y, Z)|Xs], Acc, C):- Z="cs", countNonInf(Xs, Acc, C).

% avg di All gli exams

avgAll([], 0).
avgAll([exam(X, Y, Z)|Xs], AVG):- sumAll([exam(X, Y, Z)|Xs], S), countAll([exam(X, Y, Z)|Xs], C), compute(S, C, AVG), !.

sumAll([exam(X, Y, Z)|Xs], Sum):- sumAll([exam(X, Y, Z)|Xs], 0, Sum).
sumAll([], Sum, Sum).
sumAll([exam(X, Y, Z)|Xs], Acc, Sum):- Acc1 is Acc+Y, sumAll(Xs, Acc1, Sum).

countAll([exam(X, Y, Z)|Xs], C):- countAll([exam(X, Y, Z)|Xs], 0, C).
countAll([], C, C).
countAll([exam(X, Y, Z)|Xs], Acc, C):- Acc1 is Acc+1, countAll(Xs, Acc1, C).