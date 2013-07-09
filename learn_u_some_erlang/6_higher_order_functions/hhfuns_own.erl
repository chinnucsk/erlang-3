-module(hhfuns_own).
-compile(export_all).

reverse(L) ->
  reverse(L, []).

reverse([], Acc) ->
  Acc;
reverse([H|T], Acc) ->
  reverse(T, [H|Acc]).

map(F, L) ->
  reverse(map(F, L, [])).

map(_, [], Acc) ->
  Acc;
map(F, [H|T], Acc) ->
  map(F, T, [F(H) | Acc]).

filter(Pred, L) ->
  reverse(filter(Pred, L, [])).

filter(_, [], Acc) ->
  Acc;
filter(Pred, [H|T], Acc) ->
  case Pred(H) of
  	true ->
  	  filter(Pred, T, [H|Acc]);
  	false ->
  	  filter(Pred, T, Acc)
  end.

fold(_, [], Start) ->
  Start;
fold(F, [H|T], Start) ->
  fold(F, T, F(H, Start)).