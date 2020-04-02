-module(day3).
-export([loop/0]).
-export([loop1/0]).
-export([translate/2]).
-export([loop2/0]).
-export([loop3/0]).
-export([loop4/0]).

loop() ->
    receive
       "casa"   ->  io:format("house~n"),
                    loop();
       "blanca"  ->  io:format("white~n"),
                    loop();
       _        ->  io:format("I don't understand.~n"),
                    loop()
end.
loop1() ->
    receive
      {Pid,"casa"}    ->  Pid ! "house",
                          loop1();
      {Pid,"blanca"}  ->  Pid ! "white",
                          loop1();
      {Pid, _ }       ->  Pid ! "I don't understand.",
                          loop1()
end.

translate(To, Word) ->
        To ! {self(), Word},
        receive
           Translation -> Translation
        end.

loop2()  ->
    receive
       3   -> io:format("bang.~n"), exit({day3,die,at,erlang:time()});
       _   -> io:format("click~n"), loop2()
end.

loop3()   ->
             process_flag(trap_exit, true),
             receive
                {monitor, Process}   ->
                           link(Process),
                           io:format("Monitoring process.~n"),
                           loop3();
                {'EXIT', From, Reason} ->
                           io:format("The shooter ~p died with reason ~p.", [From, Reason]),
                           io:format("Start another one.~n"),
                           loop3()
end.

loop4()  ->
            process_flag(trap_exit,true),
            receive
                new ->
                         io:format("Creating and monitoring process.~n"),
                         register(revolver, spawn_link(fun day3:loop2/0)),
                         loop4();
                {'EXIT', From, Reason } ->
                         io:format("The shooter ~p died with reason ~p.", [From, Reason]),
                         io:format(" Restarting. ~n"),
                         self() ! new,
                         loop4()
end.
