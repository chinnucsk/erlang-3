-module(powers).
-export([raise/2]).

-spec(raise(number(), integer()) -> number()).
raise(_, 0) ->
  1;
raise(X, 1) ->
  X;
raise(X, N) ->
  if
  	N > 0 ->
  	  X * raise(X, N - 1);
    true ->
      1.0 / raise(X, -N)
  end.