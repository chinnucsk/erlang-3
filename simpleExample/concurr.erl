-module(concurr).
-export([start/0, say_something/2]).
-export([start_2/0, ping/2, pong/0]).

say_something(What, 0) ->
  done;
say_something(What, Times) ->
  io:format("~p~n", [What]),
  say_something(What, Times - 1).

start() ->
  spawn(concurr, say_something, [hello, 3]),
  spawn(concurr, say_something, [goodbye, 4]).

ping(0, Pong_pid) ->
  Pong_pid ! finished,
  io:format("ping finished~n", []);
ping(N, Pong_pid) ->
  Pong_pid ! {ping, self()},
  receive
    pong ->
      io:format("ping received pong~n", [])
  end,
  ping(N - 1, Pong_pid).

pong() ->
  receive 
    finished -> 
      io:format("pong finished~n", []);
    {ping, Ping_pid} ->
      io:format("pong received ping~n", []),
      Ping_pid ! pong,
      pong()
  end.

start_2() ->
  Pong_pid = spawn(concurr, pong, []),
  spawn(concurr, ping, [3, Pong_pid]).

