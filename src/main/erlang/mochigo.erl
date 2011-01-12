%%% @author Olle Törnström <olle@studiomediatech.com>
%%% @copyright (C) 2011, Olle Törnström
%%% @doc
%%% The entry module for my little application example, with an embedded
%%% MochiWeb server.
%%% @end
-module(mochigo).
-behaviour(application).
-export([start/2, stop/1, response/1]).

%% @doc
%% Runs the mochigo application, starting a mochiweb server.
%% @end
start(_StartType, _StartArgs) ->
    io:format("Starting mochigo...~n", []),
    {ok, Server} = mochiweb_http:start([{loop, {?MODULE, response}}]),
    io:format("Server ~p started~n", [Server]),
    {ok, self(), Server}.

%% @doc
%% Stops the mochigo application and the mochiweb server.
%% @end
stop(Server) ->
    io:format("Stopping mochigo server ~p~n", [Server]),
    mochiweb_http:stop(Server),
    ok.

%% @private
%% @doc
%% Handles a web request, responds with some HTML output.
%% @end
response(Request) ->
    "/" ++ Path = Request:get(path),
    io:format("Serving request for path ~p~n", [Path]),
    Request:ok({"text/plain", Path ++ ": foobar!"}).

