-module(string).
-export([fun, add]).

add(What, 0) ->
	;
add(What, Times) ->
	append([A, B]),
	io:format("", [What]),
	add(What, Times - 1).
	
start() ->
	spawn(string, add, [A, 14]),
	spawn(string, add, [B, 14]).

