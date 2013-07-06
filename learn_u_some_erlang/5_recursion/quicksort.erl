-module(quicksort).
-export([quicksort/1]).
-export([lc_quicksort/1]).
-export([bestest_qsort/1]).

quicksort([]) -> 
  [];
quicksort([Pivot | Rest]) ->
  {Smaller, Larger} = partition(Pivot, Rest, [], []),
  quicksort(Smaller) ++ Pivot ++ quicksort(Larger).

partition(_, [], Smaller, Larger) ->
  {Smaller, Larger};
partition(Pivot, [Head|Tail], Smaller, Larger) ->
  if
    Head =< Pivot ->
      partition(Pivot, Tail, [Head|Smaller], Larger);
    true ->
      partition(Pivot, Tail, Smaller, [Head|Larger])
  end.

lc_quicksort([]) -> [];
lc_quicksort([Pivot|Rest]) ->
lc_quicksort([Smaller || Smaller <- Rest, Smaller =< Pivot])
++ [Pivot] ++
lc_quicksort([Larger || Larger <- Rest, Larger > Pivot]).

%% BESTEST QUICKSORT, YEAH!
%% (This is not really the bestest quicksort, because we do not do
%%  adequate pivot selection. It is the bestest of this book, alright?
%%  Thanks to literateprograms.org for this example. Give them a visit!
%%  http://en.literateprograms.org/Quicksort_(Erlang) )
bestest_qsort([]) -> [];
bestest_qsort(L=[_|_]) ->
    bestest_qsort(L, []).

bestest_qsort([], Acc) -> Acc;
bestest_qsort([Pivot|Rest], Acc) ->
    bestest_partition(Pivot, Rest, {[], [Pivot], []}, Acc).

bestest_partition(_, [], {Smaller, Equal, Larger}, Acc) ->
    bestest_qsort(Smaller, Equal ++ bestest_qsort(Larger, Acc));
bestest_partition(Pivot, [H|T], {Smaller, Equal, Larger}, Acc) ->
    if H < Pivot ->
           bestest_partition(Pivot, T, {[H|Smaller], Equal, Larger}, Acc);
       H > Pivot ->
           bestest_partition(Pivot, T, {Smaller, Equal, [H|Larger]}, Acc);
       H == Pivot ->
           bestest_partition(Pivot, T, {Smaller, [H|Equal], Larger}, Acc)
    end.
