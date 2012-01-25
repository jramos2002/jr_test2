%% Author: jramos
%% Created: 23/01/2012
%% Description: TODO: Add description to tut20
-module(tut20).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/1, ping/2, pong/0]).


%%
%% API Functions
%%
ping(N, Pong_Pid) -> 
	link(Pong_Pid),
	ping1(N, Pong_Pid).

pin1(0, _) -> 
	exit(ping);

ping1(N, Pong_Pid) ->
	Pong_Pid ! {ping, self()}, 
	receive
		pong ->
			io:format("Ping received pong~n", [])
	end,
	ping1(N - 1, Pong_Pid).

pong() ->
    receive
		{ping, Ping_PID} ->
		io:format("Pong received ping~n", []), Ping_PID ! pong,
		pong()
	end.

start(Ping_Node) ->
		PongPID = spawn(tut20, pong, []), 
		spawn(Ping_Node, tut20, ping, [3, PongPID]).



%%
%% Local Functions
%%

