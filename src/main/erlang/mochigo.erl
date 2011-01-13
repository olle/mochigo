-module(mochigo).
-behaviour(application).
-export([start/2, stop/1, response/1]).

start(_StartType, _StartArgs) ->
    {ok, Server} = mochiweb_http:start([{loop, {?MODULE, response}}]),
    {ok, self(), Server}.

stop(Server) ->
    mochiweb_http:stop(Server),
    ok.

response(Request) ->
    Request:ok({"text/html", "<h1>MochiGo!</h1>"}).

