even([],[]).
even([X|[]],[X]).
even([Head1 |[Head2 | Tail]],[Head1|Y]) :-
							even(Tail,Y).
