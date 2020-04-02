sum(0,[]).
sum(Total,[Head|Tail]) :- sum(Count,Tail), Total is Count + Head.

