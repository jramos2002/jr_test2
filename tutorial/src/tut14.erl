%% Author: jramos
%% Created: 20/01/2012
%% Description: TODO: Add description to tut14
-module(tut14).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([start/0, say_something/2]).

%%
%% API Functions
%%

say_something(What, 0) -> done;

say_something(What, Times) ->
	io:format("~p~n", [What]),
	say_something(What, Times - 1).


	
start() -> 
	spawn(tut14, say_something, [hello, 3]),
	spawn(tut14, say_something, [goodbye, 3]).


%%
%% Local Functions
%%

