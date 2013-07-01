-module(dijkstra).
-export([gcd/2]).

gcd(N, N) ->
  N;
gcd(M, N) ->
  if
  	M > N ->
  		gcd(M - N, N);
  	true ->
  	    gcd(M, N - M)
  end.