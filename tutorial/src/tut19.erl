%% Author: jramos
%% Created: 23/01/2012
%% Description: TODO: Add description to tut19
-module(tut19).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start_ping/1, start_pong/0, ping/2, pong/0]).

%%
%% API Functions
%%

ping(0, _) ->
	io:format("ping finished~n", []);

ping(N, Pong_Node) ->
	{pong, Pong_Node} ! {ping, self()}, receive
		pong ->
			io:format("Ping received pong~n", [])
		end,
		ping(N - 1, Pong_Node).

pong() ->
    receive
		{ping, Ping_PID} ->
			io:format("Pong received ping~n", []), Ping_PID ! pong,
			pong()
	after 5000 ->
		io:format("Pong timed out~n", [])
	end.

start_pong() ->
	register(pong, spawn(tut19, pong, [])).

start_ping(Pong_Node) ->
	spawn(tut19, ping, [3, Pong_Node]).

%%
%% Local Functions
%%

