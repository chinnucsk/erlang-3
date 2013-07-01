-module(timer).
-export([print_time/1]).

print_time(N) ->
  erlang:send_after(1000, self(), "1 sencond"),
  receive
    "1 sencond" ->
      io:format("~w seconds passed!~n", [N])
  end,
  print_time(N + 1).