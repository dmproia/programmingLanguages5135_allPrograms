  1 -module(ass4).
  2 -export([start/0,addA/2,addB/0]).
  3 
  4 addA(0, B_PID) ->
  5     B_PID ! finished,
  6     io:format("~nA has completed~n", []);
  7 
  8 addA(N, B_PID) ->
  9     B_PID ! {addA, self()},
 10     receive
 11         addB ->
 12             io:format("A", [])
 13     end,
 14     addA(N - 1, B_PID).
 15 
 16 addB() ->
 17     receive
 18         finished ->
 19             io:format("B has completed~n", []);
 20         {addA, A_PID} ->
 21             io:format("B", []),
 22             A_PID ! addB,
 23             addB()
 24     end.
 25 
 26 len(String) -> Length.
 27 
 28 start() ->
 29     B_PID = spawn(ass4, addB, []),
 30     spawn(ass4, addA, [14, B_PID]).