% Ficha n. 2 ALGAV


/*================EXA=================*/
media(L,M):-L\==[], conta(L,C), soma(L,S),M is S/C.

conta([], 0).
conta([_|L],C):-conta(L,C1), C is C1 + 1.

soma([], 0).
soma([X|L], S):-soma(L,S1), S is X+S1.

/*_______________ou__________*/
/*
contasoma([], 0, 0).
contasoma([X|L], C, S):-contasoma(L,C1,S1),C is C1+1, S is S1+X.

media(L,M):-contasoma(L,C,S), M is S/C.
*/

/*================EXB=================*/
menor([X], X):-!.
menor([H|T], M):- menor(T, M1), ((H<<M1, !, M is H), M is M1).

/*================EXC=================*/
parImpar([],0,0).
parImpar([H|T],P, I):- ((0 is H mod 2, !, parImpar(T, P1, I1), P is P1+1), parImpar(T,P1,I1), I is I1+1).

/*================EXD=================*/
repetidos([H|T]):-member(H, T),!.
repetidos([_|L]):-repetidos(L).

/*================EXE=================*/
menorFrenteLista([H|T], [M|L1]):-menor([H|T], M), apaga(M, [H|T], L1).

/*================EXF=================*/
concatena([],L,L).
concatena([H|T], C,[H|B]):-concatena(T,C,B).

/*================EXG=================*/
flatten([],[]).
flatten([[H|T]|L],LF):-append([H|T],L,L1), flatten(L1,LF).
flatten([X|L], [X|LF]):-flatten(L,LF).

/*================EXH=================*/
eliminar(_, [],[]).
eliminar(H,[H|L], L):-!.
eliminar(X,[H|L], [H|L1]):-eliminar(X,L,L1).

/*================EXI=================*/
eliminarTodos(_, [],[]).
eliminarTodos(H,[H|L], M):-!,eliminarTodos(H,L,M),!.
eliminarTodos(X,[H|L], [H|M]):-eliminarTodos(X,L,M).

/*================EXJ=================*/
substitui(_,_,[],[]).
substitui(X,Y,[X|L],[Y|L1]):-!,substitui(X,Y,L,L1).
substitui(X,Y,[Z|L],[Z|L1]):-substitui(X,Y,L,L1).

/*================EXK=================*/
inserir(X,1,L,[X|L]).
inserir(X,N,[Y|L],[Y|L1]):-N1 is N-1, inserir(X,N1,L,L1).

/*================EXL=================*/
inverte(L,L1):-inverte1(L,[],L1).
inverte1([],L,L).
inverte1([X|L],L2,L3):-inverte1(L,[X|L2],L3).

/*================EXM=================*/
uniao([],L,L).
uniao([H|L1],L2,LF):-membro(H,L2),!,uniao(L1,L2,LF).
uniao([H|L1],L2,[H|LF]):-uniao(L1,L2,LF).

/*================EXN=================*/
intersecao([],_,[]):-!.
intersecao([H|T],L2,[H|LF]):-membro(H,L2),!, intersecao(T,L2,LF).
intersecao([_|T],L2,LF):-intersecao(T,L2,LF).

/*================EXO=================*/
diferenca(L1,L2,LD):-diferenca1(L1,L2,LD1), diferenca1(L2,L1,LD2), append(LD1,LD2,LD).

diferenca1([],_,[]).
diferenca1([H|T],L,N):-member(H,L),!,diferenca1(T,L,N).
diferenca1([H|T],L,[H|N]):-diferenca1(T,L,N).
