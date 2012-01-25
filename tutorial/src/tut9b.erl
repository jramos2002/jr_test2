%% Author: jramos
%% Created: 20/01/2012
%% Description: TODO: Add description to tut9b
-module(tut9b).

%%
%% Include files
%%

%%
%% Exported Functions
%%
-export([test_if/2]).

%%
%% API Functions
%%
test_if(A, B) ->
    if
        A == 5 ->
            io:format("A = 5~n", []),
            a_equals_5;
        B == 6 ->
            io:format("B = 6~n", []),
            b_equals_6;
        A == 2, B == 3 ->               %i.e. A equals 2 and B equals 3
            io:format("A == 2, B == 3~n", []),
            a_equals_2_b_equals_3;
        A == 1 ; B == 7 ->              %i.e. A equals 1 or B equals 7
            io:format("A == 1 ; B == 7~n", []),
            a_equals_1_or_b_equals_7
    end.


%%
%% Local Functions
%%

