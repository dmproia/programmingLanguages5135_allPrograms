-module(string).
-export([addA/1,f/1]).
-export([addB/1,f/2]).

addA([]) -> 0;
	addA([H|T]) -> A + add(T).
	
addB([]) -> 0;
	addB([H|T]) -> B + add(T).

append(List1, List2) -> List3.
	
	
f(X) when erlang:addA(X) < 29 -> erlang:append(addA, addB).
	
start() ->
	spawn(string, add, [A]),
	spawn(string, add, [B]).

