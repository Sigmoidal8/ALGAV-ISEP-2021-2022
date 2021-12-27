absoluto([],[],[]).
absoluto([H1|T1],[H2|T2],[H|T]):-absoluto(T1,T2,T), ((H1>H2,!,H is H1 -H2); H is H2-H1).