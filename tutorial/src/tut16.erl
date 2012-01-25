%% Author: jramos
%% Created: 23/01/2012
%% Description: TODO: Add description to tut16
-module(tut16).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/0, ping/1, pong/0]).

%%
%% API Functions
%%
ping(0) ->
	pong ! finished,
	io:format("ping finished~n", []);

ping(N) ->
	pong ! {ping, self()},
	receive
       	pong ->
           	io:format("Ping received pong~n", []),
			io:format("------------------~n", [])
			%			io:format("-----------------~p~n", [N]),
			%io:format("X---~w~n",[Pong_PID])
	end,
	ping(N - 1).

pong() ->
    receive
		finished -> io:format("Pong finished~n", []);
		{ping, Ping_PID} ->
			io:format("Pong received ping~n", []),
						io:format("pong------------------~n", []),
						io:format("OOO-----------------~n", []),
			io:format("X---~w~n",[Ping_PID]),
			Ping_PID ! pong,
			pong()
	end.

start() ->
	register(pong, spawn(tut16, pong, [])),
	%io:format("------------------~n", []),
	%	io:format("------------------~n", []),
	%io:format("~p~n", [Pong_PID]),
	spawn(tut16, ping, [3]).



%%
%% Local Functions
%%

