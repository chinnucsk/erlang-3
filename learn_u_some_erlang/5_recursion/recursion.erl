-module(recursion).
-export([count/1, len/1]).
-export([duplicate/2]).
-export([reverse/1]).
-export([sublist/2]).
-export([tail_sublist/2]).

-spec(count(tuple()) -> number()).
count(A) ->
  count(A, 0).

count([], Number) ->
  Number;
count([_ | Rest], Number) ->
  count(Rest, Number + 1).

-spec(len(tuple()) -> number()).
len([]) ->
  0;
len([_|T]) ->
  1 + len(T).

duplicate(0, Term) ->
  [];
duplicate(N, Term) when N > 0 ->
  [ Term |duplicate(N - 1, Term)].

tail_duplicate(N, Term) -> 
  tail_duplicate(N, Term, []).

tail_duplicate(0, Term, Accur) ->
  Accur;
tail_duplicate(N, Term, Accur) when N > 0 ->
  tail_duplicate(N - 1, Term, [Term | Accur]).

-spec(reverse(list()) -> list()).
reverse(List) ->
  reverse(List, []).

reverse([], Result) ->
  Result;
reverse([Head | Rest], Result) ->
  reverse(Rest, [Head | Result]).

sublist(_, 0) ->
  [];
sublist([], _) ->
  [];
sublist([H|R], N) ->
  [H|sublist(R, N - 1)].

tail_sublist(L, N) ->
  lists:reverse(tail_sublist(L, N, [])).

tail_sublist(L, 0, Result) ->
  Result;
tail_sublist([H|R], N, Result) ->
  tail_sublist(R, N - 1, [H|Result]).
