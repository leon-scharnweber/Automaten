-module('deaEngineTest_SUITE').
-export([all/0, init_per_suite/1, end_per_suite/1]).
-export([
    tf01/1,
    tf02/1,
    tf08/1
]).

-define(value(Key, Config), proplists:get_value(Key, Config)).

all() ->
    [tf01, tf02, tf08].

init_per_suite(Config) ->
    DEA01 = {
        % Zustände und ob sie end Zustände sind
        [{a, true}, {b, true}, {c, false}],
        % Alpabet
        ["a", "b", "c"],
        % Zustandsübergänge
        [
            {a, "a", a},
            {a, "b", b},
            {a, "c", c},
            {b, "a", a},
            {b, "b", b},
            {b, "c", c},
            {c, "a", a},
            {c, "b", b},
            {c, "c", c}
        ],
        % Startzustand
        a
    },
    DEA02 = {
        % Zustände und ob sie end Zustände sind
        [{a, true}],
        % Alpabet
        ["a"],
        % Zustandsübergänge
        [
            {a, "a", a}
        ],
        % Startzustand
        a
    },
    DEA03 = {
        % Zustände und ob sie end Zustände sind
        [],
        % Alpabet
        ["a"],
        [],
        % Startzustand
        []
    },
    DEA08 = {
        % Zustände und ob sie end Zustände sind
        [{a, false}, {b, true}, {c, false}],
        % Alpabet
        ["a", "b", "c"],
        % Zustandsübergänge
        [
            {a, "b", b},
            {a, "c", c},
            {b, "a", a},
            {b, "b", b},
            {b, "c", c},
            {c, "a", a}
        ],
        % Startzustand
        a
    },
    String01 = "abbab",
    String02 = "",
    String08 = "bbab",
    [
        {dea01, DEA01},
        {dea02, DEA02},
        {dea03, DEA03},
        {dea08, DEA08},
        {string01, String01},
        {string02, String02},
        {string08, String08}
    ].

end_per_suite(_Config) -> ok.

%%-----------------------------------------------------------------------------
tf01(ConfigData) ->
    DEA = ?value(dea01, ConfigData),
    Zeichenkette = ?value(string01, ConfigData),
    ok = engine:check(Zeichenkette, DEA).
tf02(ConfigData) ->
    DEA = ?value(dea02, ConfigData),
    Zeichenkette = ?value(string02, ConfigData),
    ok = engine:check(Zeichenkette, DEA).

tf08(ConfigData) ->
    DEA = ?value(dea08, ConfigData),
    Zeichenkette = ?value(string08, ConfigData),
    ok = engine:check(Zeichenkette, DEA).
