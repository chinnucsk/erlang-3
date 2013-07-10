-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X, Y) ->
  X() + Y().

increment([]) -> 
  [];
increment([H|T]) ->
  [H + 1 | increment(T)].

decrement([]) ->
  [];
decrement([H|T]) ->
  [H - 1| increment(T)].

map(_, []) ->
  [];
map(F, [H|T]) ->
  [F(H)|map(F, T)].

incr(X) -> X + 1.

decr(X) -> X - 1.

a() ->
  Secret = "pony",
  fun()-> Secret end.

filter(Pred, L) ->
  lists:reverse(filter(Pred, L, [])).

filter(_, [], Acc) ->
  Acc;
filter(Pred, [H|T], Acc) ->
  case Pred(H) of
  	true ->
  		filter(Pred, T, [H|Acc]);
  	false ->
  	    filter(Pred, T, Acc)
  end.

fold(F, Start, []) ->
  Start;
fold(F, Start, [H|T]) ->
  fold(F, F(Start, H), T).