-module(dates).
-export([date_parts/1]).
-export([date_parts_2/1]).

-spec(date_parts(string())-> list()).
date_parts(Date) ->
  [Y, M, D] = re:split(Date, "-", [{return,list}]).
  [element(1, string:to_integer(Y)),
   element(1, string:to_integer(M)),
   element(1, string:to_integer(D))].

-spec(date_parts_2(list()) -> list()).

date_parts_2(DateStr) ->
  [YStr, MStr, DStr] = re:split(DateStr, "-", [{return, list}]),
  [element(1, string:to_integer(YStr)),
    element(1, string:to_integer(MStr)),
    element(1, string:to_integer(DStr))].