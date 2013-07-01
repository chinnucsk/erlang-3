-module(powers_accu).
-export([raise/2]).

raise(_, 0) ->
  1;
raise(X, N) when N < 0 ->
  1.0 / raise(X, -N);
raise(X, N) ->
  raise(X, N, 1).

raise(X, 0, Accumulator) ->
  Accumulator;
raise(X, N, Accumulator) ->
  raise(X, N - 1, X * Accumulator).
