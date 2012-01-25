%% Author: jramos
%% Created: 23/01/2012
%% Description: TODO: Add description to tut18
-module(tut18).

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
ping(0, Pong_Node) ->
	{pong, Pong_Node} ! finished,
	io:format("ping finished~n", []);

ping(N, Pong_Node) ->
	{pong, Pong_Node} ! {ping, self()},
	receive
        pong ->
            io:format("Ping received pong~n", [])
	end,
	ping(N - 1, Pong_Node).

pong() ->
    receive
		finished -> 
			io:format("Pong finished~n", []);
		{ping, Ping_PID} -> 
			io:format("Pong received pong~n", []),
			Ping_PID ! pong,
			pong()
	end.

start(Ping_Node) ->
	register(pong, spawn(tut18, pong, [])), 
	spawn(Ping_Node, tut18, ping, [3, node()]).




%%
%% Local Functions
%%

