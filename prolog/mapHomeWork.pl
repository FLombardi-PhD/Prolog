% Author: Federico Lombardi 1209582
% Date: 25/05/2011

solution(ActionList):-init(I), solution(I,[],ActionList).
solution(State,VisitedStates,[]) :- final(State).
solution(State,VisitedStates, [[Action,State,NewState]|Rest]) :-
                                                 applicable(Action,State,NewState),
                                                 apply(Action,State,NewState),
                                                 \+visited(NewState,VisitedStates),
                                                 solution(NewState,[State|VisitedStates],Rest).

visited(State,[VisitedState|OtherVisitedStates]) :- sameState(State,VisitedState).
visited(State,[VisitedState|OtherVisitedStates]) :- visited(State,OtherVisitedStates).
sameState(S1,S2):- S1=S2.

init(home).
final(dis).

applicable(foot,X,Y):- edge(foot,X,Y).
applicable(metro,X,Y):- edge(metro,X,Y).
applicable(bus,X,Y):- edge(bus,X,Y).

apply(foot,X,Y).
apply(metro,X,Y).
apply(bus,X,Y).

edge(foot, home, ungheria).
edge(foot, ungheria, home).

edge(bus, ungheria, reginaElena).
edge(bus, reginaElena, ungheria).

edge(bus, reginaElena, policlinico).
edge(bus, policlinico, reginaElena).

edge(metro, policlinico, castroPretorio).
edge(metro, castroPretorio, policlinico).

edge(metro, castroPretorio, termini).
edge(metro, termini, castroPretorio).

edge(metro, termini, vittorioEmanuele).
edge(metro, vittorioEmanuele, termini).

edge(metro, vittorioEmanuele, manzoni).
edge(metro, manzoni, vittorioEmanuele).

edge(foot, manzoni, dis).
edge(foot, dis, manzoni).

edge(foot, home, acquacetosa).
edge(foot, acquacetosa, home).

edge(metro, acquacetosa, flaminio).
edge(metro, flaminio, acquacetosa).

edge(metro, flaminio, spagna).
edge(metro, spagna, flaminio).

edge(metro, spagna, barberini).
edge(metro, barberini, spagna).

edge(metro, barberini, repubblica).
edge(metro, repubblica, barberini).

edge(metro, repubblica, termini).
edge(metro, termini, repubblica).
edge(bus, repubblica, termini).
edge(bus, termini, repubblica).

edge(metro, termini, cavour).
edge(metro, cavour, termini).

edge(metro, cavour, colosseo).
edge(metro, colosseo, cavour).

edge(foot, colosseo, dis).
edge(foot, dis, colosseo).

edge(bus, policlinico, verano).
edge(bus, verano, policlinico).

edge(bus, verano, sanLorenzo).
edge(bus, sanLorenzo, verano).

edge(bus, sanLorenzo, labicana).
edge(bus, labicana, sanLorenzo).

edge(bus, labicana, manzoni).
edge(bus, manzoni, labicana).