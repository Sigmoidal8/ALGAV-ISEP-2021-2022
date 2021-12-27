%totobola([],[]).
%totobola([A|T1],[X|L]):-is_list(A),!,member(X,A),totobola(T1,L).
%totobola([H|T], [H|L]):-totobola(T,L).

totobola([],[]).
totobola([[H|T]|T1],[X|L]):-!,member(X,[H|T]),totobola(T1,L).
totobola([H|T],[H|L]):-totobola(T,L).