-module(stringy).
-export([start/0,addA/2,addB/0]).

addA(0, B_PID) ->
	B_PID ! finished,
	io:format("~nA has completed~n", []);

addA(N, B_PID) ->
	B_PID ! {addA, self()},
	receive
		addB ->
			io:format("A", [])
	end,
	addA(N - 1, B_PID).

addB() ->
	receive
		finished ->
			io:format("B has completed~n", []);
		{addA, A_PID} ->
			io:format("B", []),
			A_PID ! addB,
			addB()
	end.


start() ->
	B_PID = spawn(stringy, addB, []),
	spawn(stringy, addA, [14, B_PID]).
