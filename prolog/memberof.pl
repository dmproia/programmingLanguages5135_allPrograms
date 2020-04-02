memberof(X,[X|T]).
memberof(X,[H|T]) :- memberof(X,T).
