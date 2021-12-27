liga(a,c).
liga(c,g).


liga(a,b).
liga(a,c).
liga(a,d).
liga(b,e).
liga(b,f).
liga(c,f).
liga(c,g).
liga(d,a).
liga(d,g).
liga(d,h).
liga(d,i).
liga(e,j).
liga(f,a).
liga(f,j).
liga(f,k).
liga(g,f).
liga(g,o).
liga(g,h).
liga(h,d).
liga(h,l).
liga(i,l).
liga(j,m).
liga(j,n).
liga(k,n).
liga(k,p).
liga(l,p).

%b
dfs(O,D,C):-dfs2(O,D,[O],C).
dfs2(D,D,LA,C):-!,reverse(LA,C).
dfs2(A,D,LA,C):-liga(A,X),\+member(X,LA),dfs2(X,D,[X|LA],C).

%d
all-dfs(Orig,Dest,LCam):-findall(Cam,dfs(Orig,Dest,Cam),LCam).

%e
better-dfs(Orig,Dest,MelhorCam):-alldsf(Orig,Dest,LCam),shortList(LCam,MelhorCam).
shortList([L],L):-!.
shortList([L|L1],LMelhor):-shortList(L1,LMelhor1),length(L,C),length(LMelhor1,C1),(C<C1,!,LMelhor=L);LMelhor=Lmelhor);

%g
bfs(Orig,Dest,Cam):-bfs2(Orig,Dest,[[Orig]],Cam).
bfs2(Dest,[[Dest|T]|_],Cam):-reverse([Dest|T],Cam).
bfs2(Dest,[LA|Outros],Cam):-LA=[Act|_],findall([X|LA],(Dest\==Act,liga(Act,X),\+ member(X,LA)),Novos),append(Outros,Novos,Todos),bfs2(Dest,Todos,Cam).

%f
dfscl(O,D,C,M):-dfscl2(O,D,[O],C,M).
dfscl2(D,D,LA,C,M):-!,reverse(LA,C).
dfscl2(A,D,LA,C,M):-liga(A,X),\+member(X,LA),M1 is M-1,dfscl2(X,D,[X|LA],C,M1).