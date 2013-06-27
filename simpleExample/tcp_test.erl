-module(tcp_test).

client() ->
  SomeHostInNet = "localhost",
  {ok, Sock} = gen_tcp:connect(SomeHostInNet, 5678, [binary, {packet, 0}]),
  ok = gen_tcp:send(Sock, "Some Data"),
  ok = gen_tcp:close(Sock).

server() ->
  {ok, LSock} = gen_tcp:listen(5678, [binary, {packet, 0}, {active, false}]),
  {ok, Sock} = gen_tcp:accept(Lsock),
  ok = gen_tcp:close(Sock),
  Bin.

do_recv(Sock, Bs) ->
  case gen_tcp:recv(Sock, 0) of
    {ok, B} -> 
      do_recv(Sock, [Bs, B]);
    {error, closed} ->
      {ok, list_to_binary(Bs)}
  end.
