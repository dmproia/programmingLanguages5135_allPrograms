abs(X,Y) :- X < 0, Y is -X.
abs(X,X) :- X >= 0.


seq(X,Y,X) :- X=<Y.
seq(X,Y,Z) :- X=<Y,
			  X1 is X +1,
seq(X1,Y,Z).

has(bicycle,wheel,2).
has(bicycle,handlebar,1).
has(bicycle,break,2).
has(wheel,hub,1).
has(wheel,spoke,32).
has(bicycle,frame,1).
has(car,steering_wheel,1).
has(car,stereo,1).
has(car,tires,4).

partof(X,Y) :- has(X,Y,_).
partof(X,Y) :- has(Z,Y,_), partof(X,Z).

evenPositions([],[]).
evenPositions([H],[H]).
evenPositions([H1|[H2|T]],[H1|Y]) :- evenPositions(T,Y).

oddPositions([],[]).
oddPositions([H],[]).
oddPositions([H1,H2|T],[H2|Y]) :- oddPositions(T,Y).

mergeem([],[],[]).
mergeem([H1|T1],[H2|T2],[H1|R]) :- H1 < H2;
									mergeem(T1,[H2|T2],R).
mergeem([H1|T1],[H2|T2],[H2|R]) :- H1 >= H2;
									mergeem([H1|T1],T2,R).
