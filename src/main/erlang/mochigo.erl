%%% @author Olle Törnström <olle@studiomediatech.com>
%%% @copyright (C) 2011, Olle Törnström
%%% @doc
%%% The entry module for my little application example, with an embedded
%%% MochiWeb server.
%%% @end
-module(mochigo).
-export([start/0, stop/0]).

%% @doc
%% Starts the mochigo application.
%% @end
start() ->
    {ok, started}.

%% @doc
%% Stops the mochigo application.
%% @end
stop() ->
    {ok, stopped}.
