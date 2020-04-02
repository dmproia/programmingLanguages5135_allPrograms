lastone([H],H). #list one with number
lastone([H|T],X) :- lastone(T,X).  #list with head and a tail, then add sub goals H=head, T=tail and use recursion to solve the problem, so x should be the same in both cases

