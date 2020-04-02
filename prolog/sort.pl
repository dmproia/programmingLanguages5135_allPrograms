evenones([],[]).
evenones([H],[H]).
evenones([H1|[H2|T]],[H1|Y]) :- evenones(T,Y).

oddones([],[]).
oddones([H],[]).
oddones([H1,H2|T],[H2|Y]) :- oddones(T,Y).

mergeem([],[],[]).
mergeem([H1|T1],[H2|T2],[H1|R]) :- H1 < H2;
									mergeem(T1,[H2|T2],R).
mergeem([H1|T1],[H2|T2],[H2|R]) :- H1 >= H2;
									mergeem([H1|T1],T2,R).
