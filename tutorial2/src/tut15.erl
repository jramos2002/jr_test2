%% Author: jramos
%% Created: 20/01/2012
%% Description: TODO: Add description to tut15
-module(tut15).

%%
%% Include files
%%

%%
%%    Exported Functions
%%
-export([start/0, ping/2, pong/0]).

%%
%% API Functions
%%

ping(0, Pong_PID) ->
	Pong_PID ! finished,
	io:format("ping finished~n", []);

ping(N, Pong_PID) ->
	Pong_PID ! {ping, self()},
	receive
       	pong ->
           	io:format("Ping received pong~n", []),
			io:format("------------------~n", [])
			%			io:format("-----------------~p~n", [N]),
			%io:format("X---~w~n",[Pong_PID])
	end,
	ping(N - 1, Pong_PID).

pong() ->
    receive
		finished -> io:format("Pong finished~n", []);
		{ping, Ping_PID} ->
			io:format("Pong received ping~n", []),
						io:format("pong------------------~n", []),
						io:format("OOO-----------------~n", []),
			io:format("X---~w~n",[Ping_PID]),
			Ping_PID ! pong
			%pong()
	end.

start() ->
	Pong_PID = spawn(tut15, pong, []),
	%io:format("------------------~n", []),
	%	io:format("------------------~n", []),
	%%%io:format("~p~n", [Pong_PID]),
	spawn(tut15, ping, [3, Pong_PID]).


%%
%% Local Functions
%%

